// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mvvm/Resources/colors.dart';

class RoundButton extends StatelessWidget {
  String title;
  VoidCallback onopress;
  bool loading;
  RoundButton(
      {Key? key,
      required this.title,
      required this.onopress,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onopress,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child:loading?const CircularProgressIndicator(): Text(
          title,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: AppColors.whitecolor),
        )),
      ),
    );
  }
}
