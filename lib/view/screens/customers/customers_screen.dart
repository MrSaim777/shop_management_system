import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: context.width / 30),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: context.height / 200),
          decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: AppColors.kPrimaryColor,
                child: Text(
                  "U",
                  style: appTextStyle(
                      color: AppColors.kWhiteColor,
                      fontWeight: FontWeight.bold),
                )),
            title: Text(
              "Usama Sultan",
              style: appTextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.kBlackColor),
            ),
            subtitle: Text(
              "Pro",
              style: appTextStyle(),
            ),
          ),
        );
      },
    ));
  }
}
