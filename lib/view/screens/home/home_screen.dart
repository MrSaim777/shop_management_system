import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/view/screens/home/widgets/in_stock_prods.dart';
import 'package:shop_management/view/widgets/increasing_text.dart';
import 'package:shop_management/view/screens/home/widgets/out_of_stock_prods.dart';
import 'package:shop_management/view/screens/home/widgets/product_expense.dart';
import 'package:shop_management/view_model/auth_view_model.dart';
import 'package:shop_management/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});

  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width / 30),
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
                  Row(
                    children: [
                      InkWell(
                        onTap: () => authProvider.logout(context),
                        child: Icon(Icons.logout,
                            size: context.width / 12,
                            color: AppColors.kExpensesColor),
                      ),
                      // Icon(CupertinoIcons.bell_circle,
                      //     size: context.width / 10,
                      //     color: AppColors.kGreyColor),
                    ],
                  ),
                  // AppDrawerButton(zoomDrawerController: zoomDrawerController)
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       widget.user.displayName ?? widget.user.email!,
              //       style: appTextStyle(
              //           color: AppColors.kTextColor,
              //           fontWeight: FontWeight.w900,
              //           fontSize: 0.04),
              //     ),
              //   ],
              // ),
              SizedBox(height: context.height / 50),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width / 15,
                    vertical: context.height / 50),
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(containerBorderBig),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ConstantStrings.profit,
                            style: appTextStyle(
                                color: AppColors.kTextColor,
                                fontSize: 0.04,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(width: context.width / 30),
                          IncreasingText(
                            10540,
                            suffix: ConstantStrings.currency,
                            isSingle: true,
                            style: appTextStyle(
                                color: AppColors.kTextColor,
                                fontSize: 0.04,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(width: context.width / 30),
                          FaIcon(
                            FontAwesomeIcons.chartLine,
                            color: AppColors.kIncomeColor,
                            size: context.width / 22,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: context.height / 30),
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
              SizedBox(height: context.height / 50),
              Consumer<HomeViewModel>(
                builder: (context, homeModelView, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: context.width,
                        height: context.height / 20,
                        decoration: BoxDecoration(
                            color: AppColors.kWhiteColor,
                            borderRadius: BorderRadius.circular(
                                containerBorderCircularSmall)),
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 200),
                              right: homeModelView.productAssetsIndex == 0
                                  ? context.width / 2
                                  : 0,
                              left: homeModelView.productAssetsIndex == 1
                                  ? context.width / 2
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
                                    onTap: () => homeModelView
                                        .selectProductAssetIndex(0),
                                    child: Center(
                                      child: Text(
                                        ConstantStrings.inStock,
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
                                    onTap: () => homeModelView
                                        .selectProductAssetIndex(1),
                                    child: Center(
                                      child: Text(
                                        ConstantStrings.outOfStock,
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
                      SizedBox(height: context.height / 50),
                      homeModelView.productAssetsIndex == 0
                          ? InStockProductsList(homeModelView: homeModelView)
                          : homeModelView.outOfStockProductsList.isEmpty
                              ? SizedBox(
                                  height: context.height / 2,
                                  child: const Center(
                                      child: Text(ConstantStrings.noProducts)),
                                )
                              : OutOfStockProductsList(
                                  homeModelView: homeModelView)
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
