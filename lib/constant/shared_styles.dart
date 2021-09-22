import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

// Box Decorations

BoxDecoration fieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

InputDecoration buildSignUpInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: AppColors.kWhiteColor,
    focusColor: AppColors.kWhiteColor,
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kWhiteColor, width: 0.0)),
    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
  );
}

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const TextStyle buttonTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w700, color: Colors.white);
