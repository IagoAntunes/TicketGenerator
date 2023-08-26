import 'package:flutter/material.dart';

class AppColors {
  //Product
  static const Color purpleNormal = Color(0xff8860E6);
  static const Color purpleDark = Color(0xff5B409B);

  //Base
  static const Color greyDark = Color(0xff202024);
  static const Color grayLight = Color(0xffF3F4FE);
  static const Color white = Color(0xffFFFFFF);

  //Feedback
  static const Color success = Color(0xff04D361);
  static const Color danger = Color(0xffFF8F8F);

  //Degrade
  static const Color degrade1 = Color(0xffDEE0FC);
  static const Color degrade2 = Color(0xffBC9FFF);
  static const Color degrade3 = Color(0xff996DFF);

  static Shader linearGradient = const LinearGradient(
    colors: <Color>[
      AppColors.degrade1,
      AppColors.degrade2,
      AppColors.degrade3,
    ],
  ).createShader(const Rect.fromLTWH(80, 0.0, 250.0, 0.0));
}
