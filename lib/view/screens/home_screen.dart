import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/view/widgets/drawer_btn.dart';
import 'package:shop_management/view/widgets/increasing_text.dart';
import 'package:shop_management/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.zoomDrawerController});
  final ZoomDrawerController zoomDrawerController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth / 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ConstantStrings.greetings,
                style: appTextStyle(
                    color: AppColors.kBlackColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 0.04),
              ),
              AppDrawerButton(zoomDrawerController: zoomDrawerController)
            ],
          ),
          SizedBox(
            height: deviceHeight / 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: deviceWidth / 15, vertical: deviceHeight / 50),
            decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(containerBorderBig),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ConstantStrings.profit,
                      style: appTextStyle(
                          color: AppColors.kBlackColor,
                          fontSize: 0.04,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: deviceWidth / 30,
                    ),
                    IncreasingText(
                      10540,
                      suffix: ConstantStrings.currency,
                      isSingle: true,
                      style: appTextStyle(
                          color: AppColors.kBlackColor,
                          fontSize: 0.04,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: deviceWidth / 30,
                    ),
                    FaIcon(
                      FontAwesomeIcons.chartLine,
                      color: AppColors.kIncomeColor,
                      size: deviceWidth / 22,
                    )
                  ],
                ),
                SizedBox(
                  height: deviceHeight / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IncomeExpenseWidget(
                        containerColor: AppColors.kIncomeColor.withOpacity(.5),
                        icon: FontAwesomeIcons.arrowUp,
                        iconColor: AppColors.kIncomeColor,
                        text: ConstantStrings.income,
                        value: 23540),
                    IncomeExpenseWidget(
                        containerColor:
                            AppColors.kExpensesColor.withOpacity(.5),
                        icon: FontAwesomeIcons.arrowDown,
                        iconColor: AppColors.kExpensesColor,
                        text: ConstantStrings.expense,
                        value: 13000)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: deviceHeight / 50,
          ),
          Consumer<HomeViewModel>(
            builder: (context, homeModelView, child) {
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      width: deviceWidth,
                      height: deviceHeight / 20,
                      decoration: BoxDecoration(
                          color: AppColors.kWhiteColor,
                          borderRadius: BorderRadius.circular(
                              containerBorderCircularSmall)),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  homeModelView.selectProductAssetIndex(
                                      ConstantStrings.products),
                              child: Container(
                                decoration:
                                    homeModelView.productAssetsIndex != 0
                                        ? const BoxDecoration()
                                        : BoxDecoration(
                                            color: AppColors.kScaffoldColor,
                                            borderRadius: BorderRadius.circular(
                                                containerBorderCircularSmall),
                                            boxShadow: boxShadow),
                                child: Center(
                                  child: Text(
                                    ConstantStrings.products,
                                    style: appTextStyle(
                                        fontSize: 0.03,
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.kBlackColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  homeModelView.selectProductAssetIndex(
                                      ConstantStrings.assets),
                              child: Container(
                                decoration:
                                    homeModelView.productAssetsIndex != 1
                                        ? const BoxDecoration()
                                        : BoxDecoration(
                                            color: AppColors.kScaffoldColor,
                                            borderRadius: BorderRadius.circular(
                                                containerBorderCircularSmall),
                                            boxShadow: boxShadow),
                                child: Center(
                                  child: Text(
                                    ConstantStrings.assets,
                                    style: appTextStyle(
                                        fontSize: 0.03,
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.kBlackColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(homeModelView.productAssetsIndex == 0
                          ? ConstantStrings.products
                          : ConstantStrings.assets),
                    ))
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       FadeInAnimation(
    //         delay: 2,
    //         child: AppCard(
    //           height: 225,
    //           child: Column(
    //             children: [
    //               Row(
    //                 children: [
    //                   Text(
    //                     "Milk",
    //                     style: TextStyle(fontSize: 18),
    //                   ),
    //                   Spacer(),
    //                   // SizedBox(
    //                   //   height: 30,
    //                   //   width: 30,
    //                   //   child: Image.asset(
    //                   //     AppIcons.analytics,
    //                   //     color: AppColors.kPrimaryColor,
    //                   //   ),
    //                   // ),
    //                 ],
    //               ),
    //               Expanded(
    //                 child: ProgressWithText(
    //                   indicatorValue: 7 / 20,
    //                   title: 'Litters',
    //                   value: 7,
    //                   totalValue: 20,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       FadeInAnimation(
    //         delay: 2,
    //         child: AppCard(
    //           height: 225,
    //           child: Column(
    //             children: [
    //               Row(
    //                 children: [
    //                   Text(
    //                     "Milk",
    //                     style: TextStyle(fontSize: 18),
    //                   ),
    //                   Spacer(),
    //                   // SizedBox(
    //                   //   height: 30,
    //                   //   width: 30,
    //                   //   child: Image.asset(
    //                   //     AppIcons.analytics,
    //                   //     color: AppColors.kPrimaryColor,
    //                   //   ),
    //                   // ),
    //                 ],
    //               ),
    //               Expanded(
    //                 child: ProgressWithText(
    //                   indicatorValue: 7 / 20,
    //                   title: 'Litters',
    //                   value: 7,
    //                   totalValue: 20,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

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
                padding: EdgeInsets.all(deviceWidth / 30),
                child: FaIcon(
                  icon,
                  color: iconColor,
                  size: deviceWidth / 20,
                ),
              ),
            ),
            SizedBox(
              width: deviceWidth / 50,
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
                      color: AppColors.kBlackColor,
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
