// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAScsHBXGV8L0X6PTB8kwrxHFye5fCU_E8',
    appId: '1:1030475811078:web:57896f7e0f465916963687',
    messagingSenderId: '1030475811078',
    projectId: 'shop-management-6422a',
    authDomain: 'shop-management-6422a.firebaseapp.com',
    storageBucket: 'shop-management-6422a.appspot.com',
    measurementId: 'G-V1QFNNENG6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzZGFIpRA0JUbF0ypkGqQ_m5MT8xu0Ejo',
    appId: '1:1030475811078:android:017d97c5d56def4c963687',
    messagingSenderId: '1030475811078',
    projectId: 'shop-management-6422a',
    storageBucket: 'shop-management-6422a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVanKUdu9C61tkkkk728lYuIeVmXGNQ1Q',
    appId: '1:1030475811078:ios:59f70b40fcf42b33963687',
    messagingSenderId: '1030475811078',
    projectId: 'shop-management-6422a',
    storageBucket: 'shop-management-6422a.appspot.com',
    iosBundleId: 'com.example.shopManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVanKUdu9C61tkkkk728lYuIeVmXGNQ1Q',
    appId: '1:1030475811078:ios:6a95fb6519fe3cec963687',
    messagingSenderId: '1030475811078',
    projectId: 'shop-management-6422a',
    storageBucket: 'shop-management-6422a.appspot.com',
    iosBundleId: 'com.example.shopManagement.RunnerTests',
  );
}
