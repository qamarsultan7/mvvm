import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Model/user_model.dart';
import 'package:mvvm/Respository/auth_repository.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/View%20Model/auth_usermodel.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  bool _signuploading = false;
  bool get signuploading => _signuploading;
  setloading(value) {
    _loading = value;
    notifyListeners();
  }

  setSignuploading(value) {
    _signuploading = value;
    notifyListeners();
  }

  final _repo = Authrepository();
  Future<void> logInApi(dynamic data, BuildContext context) async {
    setloading(true);
    _repo.logInApi(data).then((value) {
      final userpref = Provider.of<UserViewModel>(context);
      userpref.savedata(UserModel(token: value['token'].toString()));
      Utils.showflushbar('Log In Successful', context, Colors.green);
      setloading(false);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setloading(false);
      Utils.showflushbar(error.toString(), context, Colors.red);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signInApi(dynamic data, BuildContext context) async {
    setSignuploading(true);
    _repo.signupterApi(data).then((value) {
      Utils.showflushbar('Sign Successful', context, Colors.green);
      setSignuploading(false);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignuploading(false);
      Utils.showflushbar(error.toString(), context, Colors.red);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
