import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/View/HomeScreen.dart';
import 'package:fluttermvvm/View/LoginScreen.dart';
import 'package:fluttermvvm/View/SignupScreen.dart';
import 'package:fluttermvvm/View/Splashscreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Splashscreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const SafeArea(
              child: Scaffold(
            body: Center(
              child: Text("No routes found !"),
            ),
          ));
        });
    }
  }
}
