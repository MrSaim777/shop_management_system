import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/view/screens/bottom_nav.dart';
import 'package:shop_management/utils/constants/colors_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Lahori Milk Shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
          useMaterial3: true,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        builder: (context, widget) {
          deviceHeight = MediaQuery.sizeOf(context).height;
          deviceWidth = MediaQuery.sizeOf(context).width;
          deviceAverageSize = (deviceHeight + deviceWidth) / 2;
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(),
              child: widget ?? const SizedBox());
        },
        home: BottomNavigation(),
      ),
    );
  }
}
