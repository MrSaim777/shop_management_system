import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/utils/routes/cupertino_router.dart';
import 'package:shop_management/view/screens/detail_screen.dart';
import 'package:shop_management/view_model/home_view_model.dart';

class OutOfStockProductsList extends StatelessWidget {
  const OutOfStockProductsList({super.key, required this.homeModelView});
  final HomeViewModel homeModelView;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: homeModelView.outOfStockProductsList.length,
      itemBuilder: (context, index) {
        final list = homeModelView.outOfStockProductsList[index];

        return Container(
          margin: EdgeInsets.symmetric(vertical: context.height / 200),
          decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: AppColors.kPrimaryColor,
                child: Text(
                  list.name[0].toUpperCase(),
                  style: appTextStyle(
                      color: AppColors.kWhiteColor,
                      fontWeight: FontWeight.bold),
                )),
            title: Text(
              list.name,
              style: appTextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.kBlackColor),
            ),
            subtitle: list.description.isEmpty
                ? null
                : Text(
                    list.description,
                    style: appTextStyle(),
                  ),
          ),
        );
      },
    );
  }
}
