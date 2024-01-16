import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/view/widgets/increasing_text.dart';
import 'package:shop_management/view/widgets/product_expense.dart';
import 'package:shop_management/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth / 30),
          child: Column(
            children: [
              SizedBox(height: context.height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ConstantStrings.greetings,
                    style: appTextStyle(
                        color: AppColors.kTextColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 0.04),
                  ),
                  const FaIcon(FontAwesomeIcons.bars)
                  // AppDrawerButton(zoomDrawerController: zoomDrawerController)
                ],
              ),
              SizedBox(height: deviceHeight / 50),
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
                              color: AppColors.kTextColor,
                              fontSize: 0.04,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(width: deviceWidth / 30),
                        IncreasingText(
                          10540,
                          suffix: ConstantStrings.currency,
                          isSingle: true,
                          style: appTextStyle(
                              color: AppColors.kTextColor,
                              fontSize: 0.04,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(width: deviceWidth / 30),
                        FaIcon(
                          FontAwesomeIcons.chartLine,
                          color: AppColors.kIncomeColor,
                          size: deviceWidth / 22,
                        )
                      ],
                    ),
                    SizedBox(height: deviceHeight / 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncomeExpenseWidget(
                            containerColor:
                                AppColors.kIncomeColor.withOpacity(.5),
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
              SizedBox(height: deviceHeight / 50),
              Consumer<HomeViewModel>(
                builder: (context, homeModelView, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: deviceWidth,
                        height: deviceHeight / 20,
                        decoration: BoxDecoration(
                            color: AppColors.kWhiteColor,
                            borderRadius: BorderRadius.circular(
                                containerBorderCircularSmall)),
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 200),
                              right: homeModelView.productAssetsIndex == 0
                                  ? deviceWidth / 2
                                  : 0,
                              left: homeModelView.productAssetsIndex == 1
                                  ? deviceWidth / 2
                                  : 0,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.kScaffoldColor,
                                      borderRadius: BorderRadius.circular(
                                          containerBorderCircularSmall),
                                      boxShadow: boxShadow)),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        homeModelView.selectProductAssetIndex(
                                            ConstantStrings.products),
                                    child: Center(
                                      child: Text(
                                        ConstantStrings.products,
                                        style: appTextStyle(
                                            fontSize: 0.03,
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.kTextColor),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        homeModelView.selectProductAssetIndex(
                                            ConstantStrings.assets),
                                    child: Center(
                                      child: Text(
                                        ConstantStrings.assets,
                                        style: appTextStyle(
                                            fontSize: 0.03,
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.kTextColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: deviceHeight / 50),
                      homeModelView.productAssetsIndex == 0
                          ? homeModelView.productsList.isEmpty
                              ? SizedBox(
                                  height: context.height / 2,
                                  child: const Center(
                                      child: Text(ConstantStrings.noProducts)),
                                )
                              : ProductsList(homeModelView: homeModelView)
                          : homeModelView.assetsList.isEmpty
                              ? SizedBox(
                                  height: context.height / 2,
                                  child: const Center(
                                      child: Text(ConstantStrings.noAssets)),
                                )
                              : AssetsList(homeModelView: homeModelView)
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.homeModelView});
  final HomeViewModel homeModelView;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: homeModelView.productsList.length,
      itemBuilder: (context, index) {
        final list = homeModelView.productsList[index];
        final formattedDateTime =
            DateFormat("dd-MM-yyyy hh:mm a").format(list.dateTime);

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
            trailing: Text(formattedDateTime),
          ),
        );
      },
    );
  }
}

class AssetsList extends StatelessWidget {
  final HomeViewModel homeModelView;

  const AssetsList({super.key, required this.homeModelView});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: homeModelView.assetsList.length,
      itemBuilder: (context, index) {
        final list = homeModelView.assetsList[index];
        final formattedDateTime =
            DateFormat("dd-MM-yyyy hh:mm a").format(list.dateTime);

        return Container(
          margin: EdgeInsets.symmetric(vertical: context.height / 200),
          decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: AppColors.kPrimaryColor,
                // backgroundColor:
                //     Colors.primaries[Random().nextInt(Colors.primaries.length)],
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
            trailing: Text(formattedDateTime),
          ),
        );
      },
    );
  }
}
