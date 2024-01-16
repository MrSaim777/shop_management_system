import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/view/screens/inventory_screen.dart';
import 'package:shop_management/view/screens/main_screen.dart';
import 'package:shop_management/view/screens/report_screen.dart';
import 'package:shop_management/view/screens/sales_screen.dart';
import 'package:shop_management/view/widgets/app_btn.dart';
import 'package:shop_management/view/widgets/app_textfield.dart';
import 'package:shop_management/view_model/home_view_model.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  // late PageController pageController;

  // @override
  // void initState() {
  //   super.initState();
  //   pageController = PageController();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   pageController.dispose();
  // }

  setIndex(int i) {
    if (i != 2) {
      setState(() {
        index = i;
        // pageController.animateToPage(index,
        //     duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
      });
    }
  }

  List<Widget> _buildScreens() {
    return [
      const MainScreen(),
      const SalesScreen(),
      const SizedBox(),
      const ReportScreen(),
      const InventoryScreen()
    ];
  }

  List<String> dropDownItems = [
    ConstantStrings.selectType,
    ConstantStrings.product,
    ConstantStrings.asset
  ];

  BottomNavigationBarItem bottomNavBarItem(
      {required IconData fontAwesomeIcon, required String lable}) {
    return BottomNavigationBarItem(
      icon: FaIcon(fontAwesomeIcon),
      label: lable,
    );
  }

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
      const BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.plus,
          color: AppColors.kWhiteColor,
        ),
        label: "",
        backgroundColor: AppColors.kWhiteColor,
      ),
      bottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.bars,
        lable: ConstantStrings.report,
      ),
      bottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.cartFlatbed,
        lable: ConstantStrings.inventory,
      ),
    ];
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: deviceWidth / 8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor),
          child: const Icon(
            Icons.add,
            color: AppColors.kWhiteColor,
          ),
          onPressed: () => floatingBtnBottomSheet(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        // margin: EdgeInsets.symmetric(horizontal: deviceWidth / 30),
        decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(containerBorderBig)),
        child: BottomNavigationBar(
          // selectedIconTheme: CupertinoIconThemeData(),
          // iconSize: deviceWidth / 15,
          type: BottomNavigationBarType.fixed,
          items: items,
          currentIndex: index,
          elevation: 1,
          onTap: (i) => setIndex(i),
          selectedItemColor: AppColors.kPrimaryColor,
          unselectedItemColor: AppColors.kGreyColor,
          showUnselectedLabels: true,
        ),
      ),
      body: IndexedStack(index: index, children: _buildScreens()),
      // body: PageView(
      //   controller: pageController,
      //   onPageChanged: (i) {
      //     setIndex(i);
      //   },
      //   children: _buildScreens(),
      // ),
    );
  }

  Future<dynamic> floatingBtnBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      barrierColor: AppColors.kTransparentColor,
      elevation: 5,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(50)),
          height: deviceHeight / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(deviceWidth / 50),
                  child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: AppColors.kWhiteColor,
                          foregroundColor: AppColors.kPrimaryColor),
                      child: FaIcon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.close,
                        size: deviceWidth / 20,
                      )),
                ),
              ),
              SizedBox(height: deviceHeight / 80),
              Consumer<HomeViewModel>(
                builder: (_, provider, child) => Column(
                  children: [
                    AppTextField(
                        textEditingController: provider.nameTextController,
                        onChanged: (value) {
                          provider.nameTextController.text = value;
                        },
                        suffixWidget: const SizedBox.shrink(),
                        // suffixWidget: InkWell(
                        //   onTap: () => FocusScope.of(context).unfocus(),
                        //   child: Text(
                        //     "Save",
                        //     style: appTextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         color: provider.isSaveBtn == true
                        //             ? AppColors.kPrimaryColor
                        //             : AppColors.kTextLiteColor),
                        //   ),
                        // ),
                        hintText: ConstantStrings.enterName),
                    SizedBox(height: deviceHeight / 50),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: deviceWidth / 20,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.kWhiteColor,
                          boxShadow: boxShadow,
                          borderRadius: BorderRadius.circular(10)),
                      child: CustomDropdown<String>(
                        decoration: CustomDropdownDecoration(
                          expandedShadow: boxShadow,
                        ),
                        hintText: ConstantStrings.selectCategory,
                        items: dropDownItems,
                        initialItem: dropDownItems[0],
                        onChanged: (value) {
                          provider.selectedType = value;
                        },
                      ),
                    ),
                    SizedBox(height: deviceHeight / 50),
                    AppButton(
                        onTap: () => provider.addToList(
                            context,
                            provider.nameTextController.text,
                            provider.selectedType),
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
