import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop_management/view/screens/customers/customers_screen.dart';
import 'package:shop_management/view/screens/home/main_screen.dart';
import 'package:shop_management/view/screens/report/report_screen.dart';
import 'package:shop_management/view/screens/sales/sales_screen.dart';

class BottomNavViewModel extends ChangeNotifier {
  // late PageController _pageController;
  int _index = 0;
  List<Widget> _buildScreens() {
    return [
      const MainScreen(),
      const SalesScreen(),
      const SizedBox.shrink(),
      const ReportScreen(),
      const CustomersScreen()
    ];
  }

  BottomNavViewModel() {
    // _pageController = PageController();
    FlutterNativeSplash.remove();
  }

  int get currentIndex => _index;
  // PageController get pageController => _pageController;

  List<Widget> get buildScreens => _buildScreens();

  void setIndex(int i) {
    _index = i;
    // _pageController.animateToPage(
    //   _index,
    //   duration: const Duration(milliseconds: 400),
    //   curve: Curves.easeOut,
    // );
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }
}
