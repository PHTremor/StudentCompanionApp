import 'package:flutter/material.dart';

//Text inside the banner
class CurveBannerText extends StatelessWidget {
  const CurveBannerText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 115.0,
      left: 130,
      child: Text(
        "Welcome!",
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontSize: 30.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
