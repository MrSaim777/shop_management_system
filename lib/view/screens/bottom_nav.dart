import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/view/screens/inventory_screen.dart';
import 'package:shop_management/view/screens/main_screen.dart';
import 'package:shop_management/view/screens/sales_screen.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const MainScreen(),
      const SalesScreen(),
      // const Center(child: Text("Add")),
      const Center(child: Text("Report")),
      const InventoryScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    // final h = MediaQuery.sizeOf(context).height;
    // final w = MediaQuery.sizeOf(context).width;

    return [
      persistentBottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.house,
        lable: "Home",
        textStyle: const TextStyle(fontSize: 12),
      ),
      persistentBottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.chartSimple,
        lable: "Sales",
        textStyle: const TextStyle(fontSize: 12),
      ),
      // PersistentBottomNavBarItem(
      //   icon: const Icon(
      //     CupertinoIcons.add,
      //   ),
      //   inactiveColorSecondary: AppColors.kGreyColor,
      //   activeColorPrimary: AppColors.kPrimaryColor,
      //   inactiveColorPrimary: AppColors.kWhiteColor,
      //   activeColorSecondary: AppColors.kWhiteColor,
      // ),
      persistentBottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.bars,
        lable: "Report",
        textStyle: const TextStyle(fontSize: 12),
      ),
      persistentBottomNavBarItem(
        fontAwesomeIcon: FontAwesomeIcons.cartFlatbed,
        lable: "Inventory",
        textStyle: const TextStyle(fontSize: 12),
      ),
    ];
  }

  PersistentBottomNavBarItem persistentBottomNavBarItem(
      {required IconData fontAwesomeIcon,
      required String lable,
      required TextStyle textStyle}) {
    return PersistentBottomNavBarItem(
      icon: FaIcon(fontAwesomeIcon),
      title: (lable),
      textStyle: textStyle,
      activeColorPrimary: AppColors.kPrimaryColor,
      inactiveColorPrimary: AppColors.kGreyColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: MediaQuery.sizeOf(context).height / 14,
      margin: EdgeInsets.zero,
      bottomScreenMargin: 0,
      // hideNavigationBar: false,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: AppColors.kWhiteColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
        colorBehindNavBar: AppColors.kWhiteColor,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 800),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 400),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
