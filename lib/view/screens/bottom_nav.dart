import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/view/screens/main_screen.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
       const MainScreen(),
      const Center(child: Text("Sales")),
      const Center(child: Text("Add")),
      const Center(child: Text("Report")),
      const Center(child: Text("Inventory")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    // final h = MediaQuery.sizeOf(context).height;
    // final w = MediaQuery.sizeOf(context).width;

    return [
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.house),
        title: ("Home"),
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: AppColors.kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.chartSimple),
        title: ("Sales"),
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary: AppColors.kPrimaryColor,
        inactiveColorPrimary: AppColors.kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.add,
        ),
        inactiveColorSecondary: AppColors.kGreyColor,
        activeColorPrimary: AppColors.kPrimaryColor,
        inactiveColorPrimary: AppColors.kWhiteColor,
        activeColorSecondary: AppColors.kWhiteColor,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.bars),
        title: ("Report"),
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary: AppColors.kPrimaryColor,
        inactiveColorPrimary: AppColors.kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.cartFlatbed),
        title: ("Inventory"),
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary: AppColors.kPrimaryColor,
        inactiveColorPrimary: AppColors.kGreyColor,
      ),
    ];
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
          NavBarStyle.style16, // Choose the nav bar style with this property.
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text("This is empty home screen of my app"),
          );
        },
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
