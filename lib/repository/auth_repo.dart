// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_management/data/connectivity_checker.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/flush_bar.dart';
import 'package:shop_management/utils/routes/cupertino_router.dart';
import 'package:shop_management/view/screens/auth/sign_in_screen.dart';
import 'package:shop_management/view/screens/bottom_nav/bottom_nav.dart';

class AuthRepository {
  FirebaseAuth auth;
  AuthRepository({
    required this.auth,
  });

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    final internetConnection = await isNetworkAvailable();
    if (internetConnection) {
      try {
        await auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((userCredential) {
          showFlushBar(
              context: context, message: ConstantStrings.registerSuccessfully);
          cupertinoRouterRemoveunti(
              context, BottomNavigation(user: userCredential.user!));
        });
      } on FirebaseAuthException catch (e, t) {
        log(e.toString(), name: "Sign in Error");
        log(t.toString(), name: "Error path");
        showFlushBar(context: context, message: e.toString());
      }
    } else {
      showFlushBar(context: context, message: ConstantStrings.noInternet);
    }
  }

  Future<void> signUp(
      BuildContext context, String email, String password) async {
    final internetConnection = await isNetworkAvailable();
    if (internetConnection) {
      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((userCredential) {
          showFlushBar(
              context: context, message: ConstantStrings.registerSuccessfully);
          cupertinoRouterRemoveunti(
              context, BottomNavigation(user: userCredential.user!));
        });
      } on FirebaseAuthException catch (e, t) {
        log(e.toString(), name: "Sign up Error");
        log(t.toString(), name: "Error path");
        showFlushBar(context: context, message: e.toString());
      }
    } else {
      showFlushBar(context: context, message: ConstantStrings.noInternet);
    }
  }

  Future<void> logout(BuildContext context) async {
    final internetConnection = await isNetworkAvailable();
    if (internetConnection) {
      try {
        await auth.signOut().then((_) {
          showFlushBar(
              context: context, message: ConstantStrings.logginSuccessfull);
          cupertinoRouterRemoveunti(context, const SignInScreen());
        });
      } on FirebaseAuthException catch (e, t) {
        log(e.toString(), name: "logout Error");
        log(t.toString(), name: "Error path");
        showFlushBar(context: context, message: e.toString());
      }
    } else {
      showFlushBar(context: context, message: ConstantStrings.noInternet);
    }
  }
}
