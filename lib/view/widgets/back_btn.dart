import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: context.width / 25, vertical: context.height / 80),
            surfaceTintColor: AppColors.kWhiteColor,
            elevation: 5,
            fixedSize: Size(context.width / 4, context.height/ 20)),
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: AppColors.kBlackColor,
              size: context.width / 25,
            ),
            SizedBox(width: context.width / 50),
            Text(ConstantStrings.back,
                style: appTextStyle(
                    color: AppColors.kBlackColor,
                    fontSize: 0.030,
                    fontWeight: FontWeight.bold))
          ],
        ));
  }
}
