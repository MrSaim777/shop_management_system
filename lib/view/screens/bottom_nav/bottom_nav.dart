import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/view/widgets/app_btn.dart';
import 'package:shop_management/view/widgets/app_cupertino_textfield.dart';
import 'package:shop_management/view/widgets/date_picker.dart';
import 'package:shop_management/view_model/bottom_nav_view_model.dart';
import 'package:shop_management/view_model/home_view_model.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      bottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.house,
        lable: ConstantStrings.home,
      ),
      bottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.chartSimple,
        lable: ConstantStrings.sales,
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.only(top: context.width / 50),
          child: SizedBox(
            height: context.height / 25,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  elevation: 5,
                  padding: EdgeInsets.zero),
              child: const Icon(
                Icons.add,
                color: AppColors.kWhiteColor,
              ),
              onPressed: () =>
                  floatingBtnBottomSheet(context, context.height / 1.35),
            ),
          ),
        ),
        label: "",
        backgroundColor: AppColors.kWhiteColor,
      ),
      bottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.database,
        lable: ConstantStrings.report,
      ),
      bottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.users,
        lable: ConstantStrings.customers,
      ),
    ];
    return Scaffold(
        // floatingActionButton: Padding(
        //   padding: EdgeInsets.only(top: context.width / 8),
        // child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: AppColors.kPrimaryColor,
        //     elevation: 5,
        //   ),
        //   child: const Icon(
        //     Icons.add,
        //     color: AppColors.kWhiteColor,
        //   ),
        //   onPressed: () =>
        //       Provider.of<AuthViewModel>(context).logout(context),
        // ),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          // margin: EdgeInsets.symmetric(horizontal: context.width / 30),
          decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(containerBorderBig)),
          child: Consumer<BottomNavViewModel>(
            builder: (context, provider, child) => BottomNavigationBar(
              // selectedIconTheme: CupertinoIconThemeData(),
              // iconSize: context.width / 15,
              type: BottomNavigationBarType.fixed,
              items: items,
              currentIndex: provider.currentIndex,
              elevation: 1,
              onTap: (i) => provider.setIndex(i),
              selectedItemColor: AppColors.kPrimaryColor,
              unselectedItemColor: AppColors.kGreyColor,
              showUnselectedLabels: true,
            ),
          ),
        ),
        body: Consumer<BottomNavViewModel>(
            builder: (context, provider, child) => IndexedStack(
                index: provider.currentIndex,
                children: provider.buildScreens)));
  }

  BottomNavigationBarItem bottomNavBarItem(
      {required IconData fontAwesomeIcon, required String lable}) {
    return BottomNavigationBarItem(
      icon: FaIcon(fontAwesomeIcon),
      label: lable,
    );
  }

  Future<dynamic> floatingBtnBottomSheet(BuildContext context, double height) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      // barrierColor: AppColors.kTransparentColor,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(context.width / 50),
                  child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: AppColors.kWhiteColor,
                          foregroundColor: AppColors.kPrimaryColor),
                      child: FaIcon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.close,
                        size: context.width / 20,
                      )),
                ),
              ),
              SizedBox(height: context.height / 80),
              Consumer<HomeViewModel>(
                builder: (_, provider, child) => Column(
                  children: [
                    AppCupertinoTextField(
                        textEditingController: provider.nameController,
                        onChanged: (value) {
                          provider.nameController.text = value;
                        },
                        hintText: ConstantStrings.enterName),
                    SizedBox(height: context.height / 50),
                    AppCupertinoTextField(
                        textEditingController: provider.descController,
                        hintText: ConstantStrings.descriptionOptional),
                    SizedBox(height: context.height / 50),
                    Row(
                      children: [
                        Expanded(
                          child: AppCupertinoTextField(
                            edgeInsets:
                                EdgeInsets.only(left: context.width / 20),
                            textEditingController:
                                provider.purchasePriceController,
                            hintText: ConstantStrings.purchasePrice,
                            textInputType: TextInputType.number,
                            prefixWidget: Padding(
                              padding:
                                  EdgeInsets.only(left: context.width / 20),
                              child: Text(
                                ConstantStrings.currency,
                                style: appTextStyle(
                                    color: AppColors.kBlackColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: context.width / 30),
                        Expanded(
                          child: AppCupertinoTextField(
                            edgeInsets:
                                EdgeInsets.only(right: context.width / 20),
                            textEditingController: provider.salePriceController,
                            hintText: ConstantStrings.salePrice,
                            textInputType: TextInputType.number,
                            prefixWidget: Padding(
                              padding:
                                  EdgeInsets.only(left: context.width / 20),
                              child: Text(
                                ConstantStrings.currency,
                                style: appTextStyle(
                                    color: AppColors.kBlackColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.height / 50),
                    Row(
                      children: [
                        Expanded(
                          child: AppCupertinoTextField(
                            textInputType: TextInputType.number,
                            textEditingController: provider.quantityController,
                            hintText: ConstantStrings.quantity,
                          ),
                        ),
                        Container(
                          width: context.width / 2.3,
                          margin: EdgeInsets.only(right: context.width / 30),
                          decoration: BoxDecoration(
                              color: AppColors.kWhiteColor,
                              // boxShadow: boxShadow,
                              borderRadius: BorderRadius.circular(10)),
                          child: CustomDropdown<String>(
                            decoration: CustomDropdownDecoration(
                              expandedShadow: boxShadow,
                            ),
                            hintText: ConstantStrings.selectWeightUnit,
                            items: provider.weightUnits,
                            initialItem: provider.weightUnits[0],
                            onChanged: (value) => provider.selectWeight(value),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: context.height / 50),
                    AppCupertinoTextField(
                      textEditingController: provider.expiryDateController,
                      onTap: () => appDatePicker(context, provider.expirtDate,
                          provider.expiryDateController, "dd/MM/yyyy"),
                      readOnly: true,
                      hintText: "DD/MM/YYYY",
                      prefixWidget: Padding(
                        padding: EdgeInsets.only(left: context.width / 20),
                        child: Text(
                          ConstantStrings.expiryDate,
                          style: appTextStyle(
                              color: AppColors.kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // SizedBox(height: context.height / 50),
                    // Container(
                    //   margin: EdgeInsets.symmetric(
                    //     horizontal: context.width / 20,
                    //   ),
                    //   decoration: BoxDecoration(
                    //       color: AppColors.kWhiteColor,
                    //       // boxShadow: boxShadow,
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: CustomDropdown<String>(
                    //     decoration: CustomDropdownDecoration(
                    //       expandedShadow: boxShadow,
                    //     ),
                    //     hintText: ConstantStrings.selectCategory,
                    //     items: provider.dropDownItems,
                    //     initialItem: provider.dropDownItems[0],
                    //     onChanged: (value) => provider.selectType(value),
                    //   ),
                    // ),
                    SizedBox(height: context.height / 50),
                    AppButton(
                        onTap: () => provider.addToList(context),
                        btnText: ConstantStrings.add)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
