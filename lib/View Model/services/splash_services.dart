import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Model/user_model.dart';
import 'package:mvvm/Utils/Routes/routes_name.dart';
import 'package:mvvm/View%20Model/auth_userModel.dart';

class SplashServices {
  Future<UserModel> getUserdata() => UserViewModel().getuserdat();

  void checkAuthenticating(BuildContext context) async {
    getUserdata().then((value) {
      if (value.token == 'null' || value.token == '') {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteNames.logIn);
      } else {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteNames.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
