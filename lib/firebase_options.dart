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
    apiKey: 'AIzaSyAZYwkCuqrcnR-YPMBzPf6jv5zDllCdYM4',
    appId: '1:252415296757:web:0a206fa4f0ef2fe584f1bc',
    messagingSenderId: '252415296757',
    projectId: 'g3-app-mobile',
    authDomain: 'g3-app-mobile.firebaseapp.com',
    storageBucket: 'g3-app-mobile.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlesha3phGZiehr2J6p8qfripL0gKkGd0',
    appId: '1:252415296757:android:fdfb90b72138bb0484f1bc',
    messagingSenderId: '252415296757',
    projectId: 'g3-app-mobile',
    storageBucket: 'g3-app-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAG0-NX-OfMqW6acF_MbN_8zLMMp6eGMFE',
    appId: '1:252415296757:ios:cd5f7f5420ed657584f1bc',
    messagingSenderId: '252415296757',
    projectId: 'g3-app-mobile',
    storageBucket: 'g3-app-mobile.appspot.com',
    iosBundleId: 'com.example.g3AppMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAG0-NX-OfMqW6acF_MbN_8zLMMp6eGMFE',
    appId: '1:252415296757:ios:cd5f7f5420ed657584f1bc',
    messagingSenderId: '252415296757',
    projectId: 'g3-app-mobile',
    storageBucket: 'g3-app-mobile.appspot.com',
    iosBundleId: 'com.example.g3AppMobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZYwkCuqrcnR-YPMBzPf6jv5zDllCdYM4',
    appId: '1:252415296757:web:9ff9ffe5716f16b284f1bc',
    messagingSenderId: '252415296757',
    projectId: 'g3-app-mobile',
    authDomain: 'g3-app-mobile.firebaseapp.com',
    storageBucket: 'g3-app-mobile.appspot.com',
  );
}
