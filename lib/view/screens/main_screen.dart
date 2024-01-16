import 'package:flutter/material.dart';
import 'package:shop_management/view/screens/home_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  // void toggleDrawer() {
  //   zoomDrawerController.toggle?.call();
  // }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
    // return ZoomDrawer(
    //   controller: zoomDrawerController,
    //   menuScreen: DrawerScreen(
    //     setIndex: (index) {
    //       setState(() {
    //         currentIndex = index;
    //       });
    //     },
    //   ),
    //   mainScreen: currentScreen(),
    //   borderRadius: 30,
    //   showShadow: true,
    //   angle: 0.0,
    //   slideWidth: 200,

      // menuBackgroundColor: AppColors.kPrimaryColor,
      // drawerShadowsBackgroundColor: AppColors.kPrimaryColor,
      // shadowLayer1Color: AppColors.kScaffoldColor,
      // shadowLayer2Color: AppColors.kScaffoldColor,
      // mainScreenOverlayColor: AppColors.kBlackColor,
      // menuScreenOverlayColor: AppColors.kBlackColor,
    // );
  }

  // Widget currentScreen() {
  //   switch (currentIndex) {
  //     case 0:
  //       return HomeScreen(zoomDrawerController: zoomDrawerController);
  //     case 1:
  //       return AccountScreen(zoomDrawerController: zoomDrawerController);
  //     case 2:
  //       return ExpensesScreen(zoomDrawerController: zoomDrawerController);

  //     default:
  //       return HomeScreen(zoomDrawerController: zoomDrawerController);
  //   }
  // }
}
