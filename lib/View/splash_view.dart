import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/Utils/Routes/routes_name.dart';
import 'package:mvvm/View%20Model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splash = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash.checkAuthenticating(context);
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushNamed(context, RouteNames.home);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
