import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import '../colors/Colors.dart';

class DeletedAdPage extends StatefulWidget {
  final void Function() getBack;

  DeletedAdPage({
    this.getBack,
  });

  @override
  _DeletedAdPageState createState() => new _DeletedAdPageState();
}

class _DeletedAdPageState extends State<DeletedAdPage> {


  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: ThemeColors.gray[900],
        ),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.035),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              width: size.width * 0.106,
                              height: size.width * 0.106,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ThemeColors.gray[800],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Icon(FeatherIcons.menu,
                                  color: ThemeColors.gray[100]),
                            ),
                            onTap: () {},
                          ),
                          // contenido aviso
                          Container(
                              child: Row(children: [
                            Text(
                              'publicado por ',
                              style: TextStyle(fontWeight: FontWeight.w300, color: ThemeColors.gray[200]),
                            ),
                            InkWell(
                              child: Text(
                                "Nadie",
                                style: TextStyle(
                                    color: ThemeColors.gray[100],
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {},
                            )
                          ])),
                        ],
                      ),
                    ),
                  ),
                  generateListPageCards(size)
                ],
              ),
              Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                    child: Center(
                      child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.22,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Lo sentimos :(",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.gray[900]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.12, vertical: size.width * 0.05),
                              child: Text(
                                "El anuncio que buscas ha sido eliminado",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: ThemeColors.gray[900]
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ThemeColors.gray[700],
                                borderRadius: BorderRadius.circular(4)
                              ),
                              height: size.width * 0.086,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                child: FlatButton(
                                  onPressed: () {
                                    widget.getBack();
                                  },
                                  child: Text(
                                    "Volver",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                    ),
                                  )
                                ),
                              ),
                            )
                          ]
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
  Widget generateListPageCards(Size size) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.width * 0.15, horizontal: size.width * 0.035),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 56,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text('Bicicleta Nueva',
                                Text("Lorem ipsum dolor",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: ThemeColors.gray[100]
                                      )
                                    ),
                                Text('publicado ' + "hace 3 siglos",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: ThemeColors.gray[100]
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 56,
                          // width: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('\$  ${999}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: ThemeColors.green[300],
                                      fontWeight: FontWeight.w500)),
                              Text('a 0 km',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: ThemeColors.gray[100]
                                  )),
                            ],
                          ))
                    ],
                  ),
                  onTap: () {
                    print("click");
                    // widget.setPage(6);
                  },
                ),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Hendrerit arcu varius eget a cras amet. Lobortis lacus fames varius turpis quam morbi lorem sit. Habitant leo pharetra suscipit porta nisi aliquam, velit ornare. Integer eros pretium massa bibendum.",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: ThemeColors.gray[100],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "#hashtag    #hashtag",
                  style: TextStyle(
                    color: ThemeColors.gray[100],
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
              ),
              Row(children: <Widget>[
                RaisedButton(
                    color: ThemeColors.gray[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(4.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text(
                      'Ver en el mapa',
                      style: TextStyle(
                        fontSize: 16,
                        color: ThemeColors.gray[200],
                      ),
                    ),
                    onPressed: () {
                      print('click ver en el mapa');
                    }),
                SizedBox(width: 20),
                RaisedButton(
                    color: ThemeColors.gray[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(4.0)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text(
                      'Contactar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.gray[200],
                      ),
                    ),
                    onPressed: () {
                      print('click contactar');
                    })
              ]),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: size.width,
                    color: ThemeColors.gray[800],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}