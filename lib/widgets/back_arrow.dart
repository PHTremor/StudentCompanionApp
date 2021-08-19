import 'package:flutter/material.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(left: 20),
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 30.0,
      ),
      //Go back to last screen /pop
      onPressed: () {
        Navigator.of(context)?.pop();
      },
    );
  }
}
