// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAdV5d2yq5cGz7HpAy_JwME1kDAmjUdLXk',
    appId: '1:103296115487:web:bef157aa95e4cbe9c0c62a',
    messagingSenderId: '103296115487',
    projectId: 'storeapp-0101',
    authDomain: 'storeapp-0101.firebaseapp.com',
    storageBucket: 'storeapp-0101.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB74UvEAaoHFoVVOTBDsIJs7n1i28XimiQ',
    appId: '1:103296115487:android:d6983e1a02e2729bc0c62a',
    messagingSenderId: '103296115487',
    projectId: 'storeapp-0101',
    storageBucket: 'storeapp-0101.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKkhFcYw6GGjCmKgaKd3A1rUtNuqaz-Pc',
    appId: '1:103296115487:ios:882b66e7dc8062ddc0c62a',
    messagingSenderId: '103296115487',
    projectId: 'storeapp-0101',
    storageBucket: 'storeapp-0101.appspot.com',
    iosBundleId: 'com.example.storeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKkhFcYw6GGjCmKgaKd3A1rUtNuqaz-Pc',
    appId: '1:103296115487:ios:882b66e7dc8062ddc0c62a',
    messagingSenderId: '103296115487',
    projectId: 'storeapp-0101',
    storageBucket: 'storeapp-0101.appspot.com',
    iosBundleId: 'com.example.storeApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAdV5d2yq5cGz7HpAy_JwME1kDAmjUdLXk',
    appId: '1:103296115487:web:b35e79ce38358ec2c0c62a',
    messagingSenderId: '103296115487',
    projectId: 'storeapp-0101',
    authDomain: 'storeapp-0101.firebaseapp.com',
    storageBucket: 'storeapp-0101.appspot.com',
  );
}