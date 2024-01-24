import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onTap,
      required this.btnText,
      this.color,
      this.textColor,
      this.elevation});
  final VoidCallback onTap;
  final String btnText;
  final Color? color;
  final Color? textColor;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation,
            surfaceTintColor: color ?? AppColors.kPrimaryColor,
            fixedSize: Size(context.width / 2,context.height / 20)),
        onPressed: onTap,
        child: Text(
          btnText,
          style: appTextStyle(
              fontWeight: FontWeight.bold,
              color: textColor ?? AppColors.kBlackColor),
        ));
  }
}
