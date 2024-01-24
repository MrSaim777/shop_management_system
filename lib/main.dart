import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_management/firebase_options.dart';
import 'package:shop_management/utils/constants/global.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/view/screens/auth/sign_in_screen.dart';
import 'package:shop_management/view/screens/bottom_nav/bottom_nav.dart';
import 'package:shop_management/view_model/auth_view_model.dart';
import 'package:shop_management/view_model/bottom_nav_view_model.dart';
import 'package:shop_management/view_model/home_view_model.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    deviceAverageSize = (context.height + context.width) / 2;
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavViewModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthViewModel(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // navigatorKey: navigatorKey,
          title: appName,
          theme: appTheme,
          builder: EasyLoading.init(),
          // builder: (context, widget) {
          //   EasyLoading.init();
          //   deviceAverageSize = (context.height + context.width) / 2;
          //   return MediaQuery(
          //       data: MediaQuery.of(context).copyWith(),
          //       child: widget ?? const SizedBox());
          // },
          home: FirebaseAuth.instance.currentUser == null
              ? const SignInScreen()
              : BottomNavigation(user: FirebaseAuth.instance.currentUser!),
        ),
      ),
    );
  }
}
