import 'package:flutter/material.dart';
import 'package:login/style.dart';

class BottomBar extends StatefulWidget {
  Function onPressed;
  bool bottomIcons;
  String text;
  IconData icons;

  BottomBar({
    @required this.onPressed,
    @required this.bottomIcons,
    @required this.icons,
    @required this.text,
  });

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: widget.bottomIcons == true
          ? Container(
              decoration: BoxDecoration(
                color: mzuniYellow.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.only(left: 10, right: 5, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    widget.icons,
                    color: mzuniGreen,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.text,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            )
          : Icon(
              widget.icons,
              size: 34.0,
              color: Colors.black45,
            ),
    );
  }
}
