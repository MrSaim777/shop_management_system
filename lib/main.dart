import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/view/screens/bottom_nav.dart';
import 'package:shop_management/utils/constants/colors_const.dart';
import 'package:shop_management/view_model/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

// GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeViewModel(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // navigatorKey: navigatorKey,
          title: 'Shop Management',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
            scaffoldBackgroundColor: AppColors.kScaffoldColor,
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
          home: const BottomNavigation(),
        ),
      ),
    );
  }
}
