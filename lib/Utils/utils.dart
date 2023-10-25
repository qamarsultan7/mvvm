import 'dart:ffi';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/Resources/colors.dart';

class Utils {
  static toastmessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.green,
    );
  }
  static void showflushbar(String textmessage, BuildContext context,Color bkcolor) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeIn,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          message: textmessage,
          flushbarPosition: FlushbarPosition.TOP,
          messageColor: AppColors.whitecolor,
          backgroundColor: bkcolor,
          icon:  Icon(
            Icons.error,
            color: AppColors.whitecolor,
          ),
          duration: const Duration(seconds: 5),
        )..show(context));
  }

  static void snackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  static changefocus(BuildContext context,FocusNode currentfocus,nextfocus){
    currentfocus.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }
static double averagerating(List<int> rating){
  var avg=0;
  for(int i=0;i<rating.length;i++){
    avg=avg+rating[i];
  }
  return double.parse((avg/rating.length).toStringAsFixed(1));
}


}
