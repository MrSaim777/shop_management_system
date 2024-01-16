import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';

showFlushBar(
    {required BuildContext context,
    required String message,
    Widget? iconWidget}) {
  return Flushbar(
    message: message,
    icon: iconWidget ?? const SizedBox.shrink(),
    duration: const Duration(seconds: 2),
    backgroundColor: AppColors.kPrimaryColor,
    // leftBarIndicatorColor: AppColors.kPrimaryColor,
    borderRadius: BorderRadius.circular(10),
    margin: EdgeInsets.symmetric(
        vertical: context.height / 50,
        horizontal: context.width / 20),
    flushbarPosition: FlushbarPosition.TOP,
  )..show(context);
}
