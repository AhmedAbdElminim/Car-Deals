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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDlJW4ahIFrytixigfrEku9SYDF6aAq0y8',
    appId: '1:994474668699:web:0568c4c5e5a10105b4cc3e',
    messagingSenderId: '994474668699',
    projectId: 'cars-deals',
    authDomain: 'cars-deals.firebaseapp.com',
    storageBucket: 'cars-deals.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0WbsmKKHBnfnWAqh3cP62gEu-34zLkac',
    appId: '1:994474668699:android:e53297e6836c1ba9b4cc3e',
    messagingSenderId: '994474668699',
    projectId: 'cars-deals',
    storageBucket: 'cars-deals.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4n2hrqvBzQXkSep7UzvtlLthLDY4t4-w',
    appId: '1:994474668699:ios:eef7fa9f39f18e56b4cc3e',
    messagingSenderId: '994474668699',
    projectId: 'cars-deals',
    storageBucket: 'cars-deals.appspot.com',
    iosClientId:
        '994474668699-1bs1gn0l5s2dqb0ml5l7upb4f4q2o6s3.apps.googleusercontent.com',
    iosBundleId: 'com.example.carDeals',
  );
}
