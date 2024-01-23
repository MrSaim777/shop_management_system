import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/view/animations/fade_in.dart';
import 'package:shop_management/view/widgets/app_card.dart';
import 'package:shop_management/view/widgets/progress_with_text.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth / 20, vertical: deviceHeight / 50),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: deviceWidth / 20,
          mainAxisSpacing: deviceWidth / 20,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return FadeInAnimation(
            delay: 2,
            child: AppCard(
              height: 225,
              child: Column(
                children: [
                  Text(
                    "Milk",
                    style: appTextStyle(color: AppColors.kTextColor),
                  ),
                  const Expanded(
                    child: ProgressWithText(
                      indicatorValue: 7 / 20,
                      title: 'Litters',
                      value: 7,
                      totalValue: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
