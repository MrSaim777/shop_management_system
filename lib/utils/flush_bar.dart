import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

showFlushBar(
    {required BuildContext context,
    required String message,
    Widget? iconWidget,
    int? seconds}) {
  EasyLoading.showToast(message,
      maskType: EasyLoadingMaskType.black,
      toastPosition: EasyLoadingToastPosition.top);
  // return Flushbar(
  //   message: message,
  //   icon: iconWidget ?? const SizedBox.shrink(),
  //   duration: Duration(seconds: seconds ?? 1),
  //   dismissDirection: FlushbarDismissDirection.HORIZONTAL,
  //   backgroundColor: AppColors.kPrimaryColor,
  //   // leftBarIndicatorColor: AppColors.kPrimaryColor,
  //   borderRadius: BorderRadius.circular(10),
  //   margin: EdgeInsets.symmetric(
  //       vertical: context.height / 50, horizontal: context.width / 20),
  //   flushbarPosition: FlushbarPosition.TOP,
  // )..show(context);
}

showSuccessMessage(String status) {
  EasyLoading.showSuccess(
    status,
    // duration: const Duration(seconds: 1)
  );
}

showFailureMessage(String status) {
  EasyLoading.showError(status);
}
