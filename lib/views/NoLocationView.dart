import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors/Colors.dart';

class NoLocationView extends StatefulWidget {

  NoLocationView();

  @override
  _NoLocationViewState createState() => new _NoLocationViewState();
}

class _NoLocationViewState extends State<NoLocationView> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  image: DecorationImage(
                    image: AssetImage("assets/noLocation.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * 0.08, horizontal: size.width * 0.08),
                child: Text(
                  "Para continuar utilizando la aplicación es necesario que actives tu ubicación",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeColors.gray[800],
                    fontSize: 24,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.08, size.width * 0.25 , size.width * 0.08, 0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: new RaisedButton(
                    color: ThemeColors.gray[900],
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: size.width * 0.048),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xffF4F4F4),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, "/");
                    },
                  )
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}