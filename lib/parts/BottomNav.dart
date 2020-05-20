import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import '../colors/Colors.dart';

class BottomNav extends StatelessWidget {

  final int index;
  final Function(int) onPressItem;

  BottomNav({ @required this.index, this.onPressItem });

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
        height: width * 0.192,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(22), bottomRight:Radius.circular(22)),
          color: Colors.black,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Opacity(
                opacity: index == 1 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(
                    FeatherIcons.map, 
                    color: index == 1 ? Colors.white : ThemeColors.purple[100]),
                  onPressed: () { onPressItem(1); }
                ),
              ),
              Opacity(
                opacity: index == 2 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(
                    FeatherIcons.list, 
                    color: index == 2 ? Colors.white : ThemeColors.purple[100]),
                  onPressed: () { onPressItem(2); }
                ),
              ),
              Opacity(
                opacity: index == 3 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(
                    FeatherIcons.plus_square, 
                    color: index == 3 ? Colors.white : ThemeColors.purple[100]),
                  onPressed: () { onPressItem(3); }
                ),
              ),
              Opacity(
                opacity: index == 4 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(
                    FeatherIcons.edit_3, 
                    color: index == 4 ? Colors.white : ThemeColors.purple[100]),
                  onPressed: () { onPressItem(4); }
                ),
              ),
              Opacity(
                opacity: index == 5 ? 1 : 0.7,
                child: IconButton(
                  icon: Icon(FeatherIcons.trending_up, color: index == 5 ? Colors.white : ThemeColors.purple[100]),
                  onPressed: () { onPressItem(5); }
                ),
              ),
            ],
          ),
        )
      );
  }
}