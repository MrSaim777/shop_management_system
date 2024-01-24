import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/view/widgets/increasing_text.dart';

class IncomeExpenseWidget extends StatelessWidget {
  const IncomeExpenseWidget({
    super.key,
    required this.containerColor,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.value,
  });

  final Color containerColor;
  final IconData icon;
  final Color iconColor;
  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: containerColor),
              child: Padding(
                padding: EdgeInsets.all(context.width / 30),
                child: FaIcon(
                  icon,
                  color: iconColor,
                  size: context.width / 20,
                ),
              ),
            ),
            SizedBox(
              width: context.width / 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: appTextStyle(),
                ),
                IncreasingText(
                  value,
                  suffix: ConstantStrings.currency,
                  isSingle: true,
                  style: appTextStyle(
                      color: AppColors.kTextColor,
                      fontSize: 0.03,
                      fontWeight: FontWeight.w900),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}