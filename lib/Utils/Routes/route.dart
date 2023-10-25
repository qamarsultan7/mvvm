
import 'package:flutter/material.dart';
import 'package:mvvm/Utils/Routes/routes_name.dart';
import 'package:mvvm/View/home_screen.dart';
import 'package:mvvm/View/login_screen.dart';
import 'package:mvvm/View/signup_screen.dart';
import 'package:mvvm/View/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      case RouteNames.logIn:
        return MaterialPageRoute(builder: (BuildContext context) =>const LoginScreen());
      case RouteNames.signup:
        return MaterialPageRoute(builder: (BuildContext context) =>const SignupScreen());
      case RouteNames.splashscreen:
        return MaterialPageRoute(builder: (BuildContext context) =>const SplashView());
      default:
      return MaterialPageRoute(builder: (_){
        return const Scaffold(body: Center(child: Text('No Route Defined'),),);
      });
    }
  }
}