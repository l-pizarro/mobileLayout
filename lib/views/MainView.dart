import 'package:flutter/material.dart';
import '../colors/Colors.dart';

// Pages
import '../pages/NewAdPage.dart';

// Parts
import '../parts/SideMenu.dart';
import '../parts/BottomNav.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {

  int _pageIndex = 3;
  bool _isCollapsed = true;
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Duration _duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  onClickMenuButtonHandler() {
    setState(() {
      if (_isCollapsed)
        _controller.forward();
      else
        _controller.reverse();

      _isCollapsed = !_isCollapsed;
    });
  }

  closeMenuFromContainer() {
    setState(() {
      if (!_isCollapsed) {
        if (_isCollapsed)
          _controller.forward();
        else
          _controller.reverse();

        _isCollapsed = !_isCollapsed;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;

    List<Widget> _pages = [
      Center(child: Text("map", style: TextStyle(color: Colors.white))),
      Center(child: Text("list", style: TextStyle(color: Colors.white))),
      // NewAdPage(
      //   closeMenuFromContainer: this.closeMenuFromContainer,
      //   onClickMenuButtonHandler: this.onClickMenuButtonHandler
      // ),
      NewAdPage(this.closeMenuFromContainer, this.onClickMenuButtonHandler),
      Center(child: Text("favs", style: TextStyle(color: Colors.white))),
      Center(child: Text("trendings", style: TextStyle(color: Colors.white))),
    ];

    return Scaffold(
      backgroundColor: ThemeColors.purple[900],
      body: Stack(
        children: <Widget>[
          SideMenu(
            screen: _screen,
            slideAnimation: _slideAnimation,
            menuScaleAnimation: _menuScaleAnimation
          ),
          pageContainer(_isCollapsed, _screen, _pages, _pageIndex)
        ],
      ),
    );
  }

  Widget pageContainer(bool isCollapsed, Size screen, List<Widget> pages, int pageIndex) {
    return AnimatedPositioned(
      duration: _duration,
      left: isCollapsed ? 0 : 0.5 * screen.width,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: _duration,
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: ThemeColors.gray[900],
          child: Container(
            width: screen.width,
            height: screen.height,
            child: Stack(children: <Widget>[
              pages[pageIndex - 1],
              isCollapsed
              ? Positioned(
                bottom: 0,
                child: BottomNav(
                  index: pageIndex,
                  onPressItem: (int selectedIndex) => setState(() { _pageIndex = selectedIndex;}),
                )
              )
              : Container()
            ],)
          )
        ),
      ),
    );
  }
}