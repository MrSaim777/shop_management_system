import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel() {
    FlutterNativeSplash.remove();
  }

  final TextEditingController _signInEmailController = TextEditingController();
  TextEditingController get signInEmailController => _signInEmailController;
  final TextEditingController _signInPasswordController =
      TextEditingController();
  TextEditingController get signInPasswordController =>
      _signInPasswordController;

  final TextEditingController _signUpEmailController = TextEditingController();
  TextEditingController get signUpEmailController => _signUpEmailController;

  final TextEditingController _signUpPasswordController =
      TextEditingController();
  TextEditingController get signUpPasswordController =>
      _signUpPasswordController;
}
