import 'package:flutter/material.dart';
import 'package:login/screens/home/events/event_details_screen.dart';
import 'package:login/screens/profile/registered_courses/registered_courses.dart';
import 'package:login/screens/login/login_screen.dart';
import 'package:login/screens/main_page.dart';
import 'package:login/screens/profile/profile.dart';

class RouteGenerator {
  const RouteGenerator._();

  //this method is called in main.dart to generate a route
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //home screen of the app (Login)
      case homePage:
        return MaterialPageRoute<LoginScreen>(
          builder: (_) => const LoginScreen(),
        );
        break;

      //bottom nav screen
      case mainPageNav:
        return MaterialPageRoute<MainPage>(
          builder: (_) => const MainPage(),
        );
        break;

      //profile screen
      case profilePage:
        return MaterialPageRoute<ProfilePage>(
          builder: (_) => const ProfilePage(),
        );
        break;

      //RegisteredCourses
      case registeredCoursesPage:
        return MaterialPageRoute<RegisteredCoursesScreen>(
          builder: (_) => const RegisteredCoursesScreen(),
        );
        break;

      //RegisteredCourses
      case eventDetailsPage:
        return MaterialPageRoute<EventDetails>(
          builder: (_) => const EventDetails(),
        );
        break;
      //other screen cases here
      default:
        throw RouteException("Route  not Found");
    }
  }

  static const homePage = '/';
  static const mainPageNav = 'main_page';
  static const profilePage = '/profile';
  static const registeredCoursesPage = '/registered_courses';
  static const eventDetailsPage = '/event_details';
}

//Exception thrown when a given route doest exist
class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
