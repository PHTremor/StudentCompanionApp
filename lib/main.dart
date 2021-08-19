import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/blocs/authentication_bloc.dart';
import 'package:login/provider/bottom_navigation_bar_provider.dart';
import 'package:login/repository/student_repository.dart';
import 'package:login/repository/student_repository/php_repository.dart';
import 'package:login/routes.dart';
import 'package:login/style.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      //the provider will cache an instance of the StudentRepository
      Provider<StudentRepository>(
        create: (_) => PhpStudentRepository(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp();

  @override
  Widget build(BuildContext context) {
    final repository = context.select((PhpStudentRepository r) => r);

    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(repository),
      child: ChangeNotifierProvider(
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
