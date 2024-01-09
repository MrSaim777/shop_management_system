import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/view/animations/floating_bubbles.dart';
import 'package:shop_management/view/screens/home_screen.dart';
import 'package:shop_management/view/widgets/drawer.dart';
import 'package:shop_management/view/widgets/drawer_btn.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: DrawerScreen(
        setIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      mainScreen: currentScreen(),
      borderRadius: 30,
      showShadow: true,
      angle: 0.0,
      slideWidth: 200,
      menuBackgroundColor: AppColors.kPrimaryColor,
      drawerShadowsBackgroundColor: AppColors.kPrimaryColor,
    );
  }

  Widget currentScreen() {
    switch (currentIndex) {
      case 0:
        return MainScreenWidget(
          title: "Home",
          zoomDrawerController: zoomDrawerController,
          body: const HomeScreen(),
        );
      case 1:
        return MainScreenWidget(
          title: "Accounts Management",
          zoomDrawerController: zoomDrawerController,
          body: Container(),
        );
      case 2:
        return MainScreenWidget(
          title: "Expense Tracking",
          zoomDrawerController: zoomDrawerController,
          body: Container(),
        );

      default:
        return MainScreenWidget(
          zoomDrawerController: zoomDrawerController,
          body: Container(),
        );
    }
  }
}

class MainScreenWidget extends StatefulWidget {
  final String title;
  final ZoomDrawerController zoomDrawerController;
  final Widget body;
  const MainScreenWidget(
      {Key? key,
      this.title = "Home",
      required this.zoomDrawerController,
      required this.body})
      : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: context.screenHeight / 15),
        child: const CustomFloatingButton(),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading:
            AppDrawerButton(zoomDrawerController: widget.zoomDrawerController),
      ),
      body: widget.body,
    );
  }
}
