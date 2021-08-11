import 'package:flutter/material.dart';
import 'package:login/provider/bottom_navigation_bar_provider.dart';
import 'package:login/routes.dart';
import 'package:login/style.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationBarProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: _theme(),
        onGenerateTitle: (context) => "Companion App",
        //Route Generator
        initialRoute: RouteGenerator.homePage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }

// This is the theme of the application.
  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(headline6: AppBarTextStyle),
      ),
      textTheme: TextTheme(
        headline6: TitleTextStyle,
        bodyText2: Body1TextStyle,
        caption: CaptionTextStyle,
        subtitle2: SubTitleTextStyle,
      ),
    );
  }
}
