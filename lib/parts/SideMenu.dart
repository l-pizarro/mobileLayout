import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {

  final Size screen;
  final Animation<Offset> slideAnimation;
  final Animation<double> menuScaleAnimation;

  SideMenu({
    @required this.screen,
    @required this.slideAnimation,
    @required this.menuScaleAnimation
  });

  @override
  Widget build(BuildContext context) {

    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuScaleAnimation,
        child: Container(
          width: screen.width,
          height: screen.height,
          child: SafeArea(
            child: Text(""),
          )
        )
      ),
    );
  }
}