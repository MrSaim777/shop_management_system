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

  clearSignInFields() {
    _signInEmailController.clear();
    _signInPasswordController.clear();
  }

  clearSignUpFields() {
    _signUpEmailController.clear();
    _signUpPasswordController.clear();
  }

  @override
  void dispose() {
    _signInEmailController.dispose();
    _signInPasswordController.dispose();
    _signUpEmailController.dispose();
    _signUpPasswordController.dispose();
    super.dispose();
  }
}
