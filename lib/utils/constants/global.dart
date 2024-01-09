import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/colors_const.dart';

double deviceWidth = 0;
double deviceHeight = 0;
double deviceAverageSize = 0;
double textSizeRegular = 0.027;

TextStyle appTextStyle(
        {FontWeight? fontWeight, double? fontSize, Color? color}) =>
    TextStyle(
        color: color ?? AppColors.kGreyColor,
        fontSize: deviceAverageSize * (fontSize ?? textSizeRegular),
        decoration: TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.normal);
