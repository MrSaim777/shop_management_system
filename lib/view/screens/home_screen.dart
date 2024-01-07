import 'package:flutter/material.dart';
import 'package:shop_management/utils/constants/assets_const.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/view/animations/fade_in.dart';
import 'package:shop_management/view/widgets/app_card.dart';
import 'package:shop_management/view/widgets/progress_with_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(),
          const FadeInAnimation(
            delay: 2,
            child: AppCard(
              height: 225,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Milk",
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      // SizedBox(
                      //   height: 30,
                      //   width: 30,
                      //   child: Image.asset(
                      //     AppIcons.analytics,
                      //     color: AppColors.kPrimaryColor,
                      //   ),
                      // ),
                    ],
                  ),
                  Expanded(
                    child: ProgressWithText(
                      indicatorValue: 7/20,
                      title: 'Litters',
                      value: 7,
                      totalValue: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
