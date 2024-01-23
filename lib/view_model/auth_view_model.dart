import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop_management/repository/auth_repo.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/flush_bar.dart';
import 'package:shop_management/utils/validator.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel() {
    FlutterNativeSplash.remove();
  }

  final AuthRepository authRepository =
      AuthRepository(auth: FirebaseAuth.instance);

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

  signIn(BuildContext context) {
    final email = _signInEmailController.text;
    final pass = _signInPasswordController.text;
    if (email.isEmpty) {
      showFlushBar(context: context, message: ConstantStrings.enterEmail);
    } else if (!RegExp(emailValidatorpattern).hasMatch(email)) {
      showFlushBar(context: context, message: ConstantStrings.invalidEmail);
    } else if (pass.isEmpty) {
      showFlushBar(context: context, message: ConstantStrings.enterPassword);
    } else if (pass.length < 8) {
      showFlushBar(context: context, message: ConstantStrings.invalidPassword);
    } else {
      authRepository.signIn(context, email, pass);
    }
  }

  signUp(BuildContext context) {
    final email = _signUpEmailController.text;
    final pass = _signUpPasswordController.text;
    if (email.isEmpty) {
      showFlushBar(context: context, message: ConstantStrings.enterEmail);
    } else if (!RegExp(emailValidatorpattern).hasMatch(email)) {
      showFlushBar(context: context, message: ConstantStrings.invalidEmail);
    } else if (pass.isEmpty) {
      showFlushBar(context: context, message: ConstantStrings.enterPassword);
    } else if (pass.length < 8) {
      showFlushBar(context: context, message: ConstantStrings.invalidPassword);
    } else {
      authRepository.signUp(context, email, pass);
    }
  }

  logout(BuildContext context){
    authRepository.logout(context);
  }

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
