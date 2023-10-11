
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/screens/auth_screen/ui/pages/login_screen.dart';
import '../../ui/screens/splash_screen/ui/pages/splash_screen.dart';
class Routes {
  static const splashScreen = "/splash_screen";
  static const welcomeScreen = "/welcome_screen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            settings: RouteSettings(name: splashScreen),
            builder: (context) => SplashScreen());

      case welcomeScreen:
        return MaterialPageRoute(
            settings: RouteSettings(name: welcomeScreen),
            builder: (context) => LoginScreen());


      default:
        return MaterialPageRoute(
            settings: RouteSettings(name: splashScreen),
            builder: (context) => SplashScreen());

    }
  }
}