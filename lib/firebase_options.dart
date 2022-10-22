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
    apiKey: 'AIzaSyCbVFhGDf7SdfqgmWZntRdTm6YV3tlCRdw',
    appId: '1:890676442108:web:5023bc7732d92768977879',
    messagingSenderId: '890676442108',
    projectId: 'gdscmaliki-7ec26',
    authDomain: 'gdscmaliki-7ec26.firebaseapp.com',
    storageBucket: 'gdscmaliki-7ec26.appspot.com',
    measurementId: 'G-DJEG8616P3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDu3NsRvWNvCocW1uZk83auhGeUwK4oBnE',
    appId: '1:890676442108:android:c840d64d4d878a21977879',
    messagingSenderId: '890676442108',
    projectId: 'gdscmaliki-7ec26',
    storageBucket: 'gdscmaliki-7ec26.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHAmuW_KB2ScQUay-oeMDkK4Wn6EfF8l0',
    appId: '1:890676442108:ios:340028160ebc7d3f977879',
    messagingSenderId: '890676442108',
    projectId: 'gdscmaliki-7ec26',
    storageBucket: 'gdscmaliki-7ec26.appspot.com',
    iosClientId: '890676442108-bqtj27tqrenshrrs8bj4d978mpjgruid.apps.googleusercontent.com',
    iosBundleId: 'com.gdscmaliki.flutterGdscmaliki',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHAmuW_KB2ScQUay-oeMDkK4Wn6EfF8l0',
    appId: '1:890676442108:ios:340028160ebc7d3f977879',
    messagingSenderId: '890676442108',
    projectId: 'gdscmaliki-7ec26',
    storageBucket: 'gdscmaliki-7ec26.appspot.com',
    iosClientId: '890676442108-bqtj27tqrenshrrs8bj4d978mpjgruid.apps.googleusercontent.com',
    iosBundleId: 'com.gdscmaliki.flutterGdscmaliki',
  );
}
