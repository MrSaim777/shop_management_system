import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_management/utils/constants/colors_const.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.kScaffoldColor
    ..backgroundColor = AppColors.kWhiteColor
    ..indicatorColor = AppColors.kPrimaryColor
    ..textColor = AppColors.kTextColor
    ..maskColor = AppColors.kPrimaryColor.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}
