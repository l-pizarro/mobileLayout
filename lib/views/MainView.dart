import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

final Color backgroundColor = Color(0xFF4A4A58);
Color gray100 = Color(0xffEBEDF1);
Color gray200 = Color(0xffD8DBE4);
Color gray300 = Color(0xffC4C9D6);
Color gray400 = Color(0xffB1B8C9);
Color gray500 = Color(0xff9DA6BB);
Color gray600 = Color(0xff7E8596);
Color gray700 = Color(0xff5E6370);
Color gray800 = Color(0xff3F424B);
Color gray900 = Color(0xff1F2125);
Color purple100 = Color(0xffE1E0EC);
Color purple200 = Color(0xffC2C1D9);
Color purple300 = Color(0xffA4A2C7);
Color purple400 = Color(0xff8583B4);
Color purple500 = Color(0xff6764A1);
Color purple600 = Color(0xff525081);
Color purple700 = Color(0xff3E3C61);
Color purple800 = Color(0xff292840);
Color purple900 = Color(0xff151420);
Color green300 = Color(0xff9AE6B4);
Color black = Color(0xff000000);
Color white = Color(0xffffffff);

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  int pageIndex = 1;

  List<String> adImages = [
    "assets/salad.png",
    "assets/cake.png",
    "assets/pizza.png",
    "assets/avocado.png",
    "assets/burguer.png",
    "assets/toast.png",
    "assets/salad2.png",
    "assets/orange.png"
  ];
  List<String> adTitles = [
    "Ensalada César ",
    "Cheesecake",
    "Pizza Veggie",
    "Palta (kilo)",
    "Hamburguesa Saludable",
    "Tostadas Francesas",
    "Ensalada",
    "Naranja (malla)"
  ];
  List<String> adPrices = [
    "1000",
    "2000",
    "400",
    "4500",
    "6700",
    "3500",
    "1040",
    "1040",
  ];
  List<String> adDistances = [
    "a 300 metros",
    "a 547 metros",
    "a 1 kilometros",
    "a 1.3 kolometros",
    "a 2 kilometros",
    "a 2 kilometros",
    "a 5 kilometros",
    "a 5 kilometros",
  ];



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  changePage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  onClickMenuButtonHandler() {
    setState(() {
      if (isCollapsed)
        _controller.forward();
      else
        _controller.reverse();

      isCollapsed = !isCollapsed;
    });
  }

  closeMenuFromContainer() {
    setState(() {
      if (!isCollapsed) {
        if (isCollapsed)
          _controller.forward();
        else
          _controller.reverse();

        isCollapsed = !isCollapsed;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;


    List<Widget> pages = [
      mapPage(screenWidth),
      listPage(context, screenWidth, screenHeight),
      Center(child: Text("nuevo anuncio", style: TextStyle(color: white))),
      favsPage(context, screenWidth, screenHeight),
      Center(child: Text("trendings", style: TextStyle(color: white))),
    ];

    return Scaffold(
      backgroundColor: purple900,
      body: Stack(
        children: <Widget>[
          menu(context),
          pageContainer(context, pages),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: SafeArea(
            child: Text(""),
          )
        )
      ),
    );
  }

  Widget pageContainer(context, pages) {
    return AnimatedPositioned(
      duration: duration,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: gray900,
          child: Container(
            width: screenWidth,
            height: screenHeight,
            child: Stack(children: <Widget>[
              pages[pageIndex - 1],
              isCollapsed ? bottomNav(screenWidth) : Container()
            ],)
          )
        ),
      ),
    );
  }

  Widget mapPage(width) {
    return GestureDetector(
      onTap: () {
        closeMenuFromContainer();
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.0),
              child: Image(
                image: AssetImage('assets/map.png'),
                fit: BoxFit.cover,
              ),
            )
          ),
          SafeArea(
            child: Container(
              width: width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: width * 0.106,
                        height: width * 0.106,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 0,
                              blurRadius: 5,
                            )
                          ]
                        ),
                        child: Icon(FeatherIcons.menu, color: purple800),
                      ),
                      onTap: () {
                        onClickMenuButtonHandler();
                      },
                    ),
                    Container(
                        width: width * 0.106,
                        height: width * 0.106,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 0,
                              blurRadius: 5,
                            )
                          ]
                        ),
                        child: InkWell(
                          child: Icon(FeatherIcons.settings, color: purple800),
                          onTap: () {},
                        )
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listPage(context, width, height) {
    return GestureDetector(
      onTap: () {
        closeMenuFromContainer();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: gray900,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: width * 0.106,
                          height: width * 0.106,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: gray800,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 0,
                                blurRadius: 5,
                              )
                            ]
                          ),
                          child: Icon(FeatherIcons.menu, color: gray100),
                        ),
                        onTap: () {
                          onClickMenuButtonHandler();
                        },
                      ),
                      Container(
                          width: width * 0.106,
                          height: width * 0.106,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: gray800,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 0,
                                blurRadius: 5,
                              )
                            ]
                          ),
                          child: InkWell(
                            child: Icon(FeatherIcons.settings, color: gray100),
                            onTap: () {},
                          )
                        ),
                    ],
                  ),
                ),
              ),
              generateListPageCards(width)
            ],
          ),
        ),
      ),
    );
  }

  Widget generateListPageCards(width) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: width * 0.15, horizontal: width * 0.035),
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(8, (index) => Padding(
                padding: const EdgeInsets.only(bottom: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        image: DecorationImage(
                          image: AssetImage(adImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 56,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(adTitles[index], style: TextStyle(fontSize: 16, color: gray100)),
                              Text(adDistances[index], style: TextStyle(fontSize: 14, color: gray600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 56,
                      width: 64,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('\$  ${adPrices[index]}', style: TextStyle(fontSize: 16, color: green300, fontWeight: FontWeight.w500)),
                        ],
                      )
                    )
                  ],
                ),
              )),
          ),
        ),
      ),
    );
  }

  Widget favsPage(context, width, height) {
    return GestureDetector(
      onTap: () {
        closeMenuFromContainer();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: gray900,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: width * 0.106,
                          height: width * 0.106,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: gray800,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 0,
                                blurRadius: 5,
                              )
                            ]
                          ),
                          child: Icon(FeatherIcons.menu, color: gray100),
                        ),
                        onTap: () {
                          onClickMenuButtonHandler();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              generateFavsPageCards(width)
            ],
          ),
        ),
      ),
    );
  }

  Widget generateFavsPageCards(width) { // ReorderList widget is needed here
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: width * 0.15, horizontal: width * 0.035),
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(8, (index) => Padding(
                padding: const EdgeInsets.only(bottom: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: width * 0.106,
                      width: width * 0.106,
                      child: Center(
                        child: Icon(FeatherIcons.align_justify, color: gray800)
                      ),
                    ),
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        image: DecorationImage(
                          image: AssetImage(adImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 56,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(adTitles[index], style: TextStyle(fontSize: 16, color: gray100)),
                              Text(adDistances[index], style: TextStyle(fontSize: 14, color: gray600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 56,
                      width: 64,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('\$  ${adPrices[index]}', style: TextStyle(fontSize: 16, color: green300, fontWeight: FontWeight.w500)),
                        ],
                      )
                    )
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNav(width) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: width * 0.192,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(22), bottomRight:Radius.circular(22)),
          color: black,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Opacity(
                opacity: pageIndex == 1 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(
                    FeatherIcons.map, 
                    color: pageIndex == 1 ? white : purple100),
                  onPressed: () {
                    changePage(1); 
                  }
                ),
              ),
              Opacity(
                opacity: pageIndex == 2 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(
                    FeatherIcons.list, 
                    color: pageIndex == 2 ? white : purple100),
                  onPressed: () {
                    changePage(2); 
                  }
                ),
              ),
              Opacity(
                opacity: pageIndex == 3 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(
                    FeatherIcons.plus_square, 
                    color: pageIndex == 3 ? white : purple100),
                  onPressed: () {
                    changePage(3); 
                  }
                ),
              ),
              Opacity(
                opacity: pageIndex == 4 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(
                    FeatherIcons.heart, 
                    color: pageIndex == 4 ? white : purple100),
                  onPressed: () {
                    changePage(4); 
                  }
                ),
              ),
              Opacity(
                opacity: pageIndex == 5 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(
                    FeatherIcons.trending_up, 
                    color: pageIndex == 5 ? white : purple100),
                  onPressed: () {
                    changePage(5); 
                  }
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}