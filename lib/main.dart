import 'package:flutter/material.dart';
import 'package:shop_management/bottom_nav.dart';
import 'package:shop_management/colors_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lahori Milk Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
        useMaterial3: true,
      ),
      home: BottomNavigation(),
    );
  }
}
