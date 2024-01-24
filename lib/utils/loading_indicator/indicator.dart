import 'package:flutter_easyloading/flutter_easyloading.dart';

appLoading(String? status, bool? dismissOnTap) {
  EasyLoading.show(
      status: status ?? "loading...", dismissOnTap: dismissOnTap ?? false);
}

closeLoading() {
  EasyLoading.dismiss();
}
