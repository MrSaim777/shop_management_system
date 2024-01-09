import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/global.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onTap, required this.btnText});
  final VoidCallback onTap;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kWhiteColor,
            foregroundColor: AppColors.kPrimaryColor,
            fixedSize: Size(deviceWidth / 2, deviceHeight / 20)),
        onPressed: onTap,
        child: Text(
          btnText,
          style: appTextStyle(
              fontWeight: FontWeight.bold, color: AppColors.kPrimaryColor),
        ));
  }
}
