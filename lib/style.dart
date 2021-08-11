import 'package:flutter/material.dart';

const LargeTextSize = 22.0;
const MediumTextSize = 16.0;
const SmallTextSize = 12.0;

const String FontNameDefault = 'Montserrat';

const Color TextColorDark = Colors.black;
const Color TextColorLight = Colors.white;
const Color TextColorRed = Colors.red;
const Color TextColorGrey = Color.fromRGBO(125, 125, 125, 1.0);

const Color mzuniGreen = Color(0xFF4CAF50);
const Color mzuniYellow = Color(0xFFFDD835);

const DefaultPaddingHorizontal = 12.0;

const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: MediumTextSize,
  color: Colors.white,
);

const TitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: LargeTextSize,
  color: Colors.black,
);

const Body1TextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: MediumTextSize,
  color: Colors.black,
);

const CaptionTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: SmallTextSize,
  color: TextColorDark,
);

const SubTitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: MediumTextSize,
  color: TextColorGrey,
);

const List<Color> greenGradients = [
  Color(0xFF4CAF50),
  Color(0xFF43A047),
];

const List<Color> yellowGradients = [
  Color(0xFFFFEB3B),
  Color(0xFFFDD835),
  Color(0xFFFBC02D),
];
