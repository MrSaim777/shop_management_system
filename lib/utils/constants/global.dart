import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_management/utils/constants/colors_const.dart';

// double deviceWidth = 0;
// double deviceHeight = 0;
double deviceAverageSize = 0;
double textSizeRegular = 0.027;
double containerBorderBig = 20.0;
double containerBorderCircularSmall = 50.0;

const appName = 'Shop Management';
final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
  scaffoldBackgroundColor: AppColors.kScaffoldColor,
  useMaterial3: true,
  fontFamily: GoogleFonts.montserrat().fontFamily,
);

TextStyle appTextStyle(
        {FontWeight? fontWeight, double? fontSize, Color? color}) =>
    TextStyle(
        color: color ?? AppColors.kGreyColor,
        fontSize: deviceAverageSize * (fontSize ?? textSizeRegular),
        decoration: TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.normal);

List<BoxShadow> boxShadow = [
  BoxShadow(
      blurRadius: 1,
      color: AppColors.kTransparentColor.withOpacity(.1),
      spreadRadius: 1,
      offset: const Offset(0, 2)),
  BoxShadow(
      blurRadius: 1,
      color: AppColors.kTransparentColor.withOpacity(.1),
      spreadRadius: 1,
      offset: const Offset(2, 0)),
];
