import 'package:flutter/material.dart';
import '../colors/Colors.dart';

class PageContainer extends StatelessWidget {

  final Size screen;
  final Animation<double> scaleAnimation;
  final Animation<double> menuScaleAnimation;
  final Duration duration;
  final bool isCollapsed;
  final Widget bottomNav;
  final int pageIndex;
  final List<Widget> pages;

  PageContainer({
    @required this.screen,
    @required this.scaleAnimation,
    @required this.menuScaleAnimation,
    @required this.duration,
    @required this.isCollapsed,
    @required this.bottomNav,
    @required this.pages,
    @required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedPositioned(
      duration: duration,
      left: isCollapsed ? 0 : 0.5 * screen.width,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          animationDuration: duration,
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
                child: bottomNav,
              )
              : Container()
            ],)
          )
        ),
      ),
    );
  }
}