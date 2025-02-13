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
    apiKey: 'AIzaSyA7aHqtjFzniZ_DOJY8gUtA8fU6SXFiLqs',
    appId: '1:995274508849:web:2c99d9182a09d6ac33a310',
    messagingSenderId: '995274508849',
    projectId: 'flutter-authen-72dd6',
    authDomain: 'flutter-authen-72dd6.firebaseapp.com',
    storageBucket: 'flutter-authen-72dd6.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUgZzEUesbSzKV53AXDAvnqYLFW3PoCOo',
    appId: '1:995274508849:android:25e777b1a062c21c33a310',
    messagingSenderId: '995274508849',
    projectId: 'flutter-authen-72dd6',
    storageBucket: 'flutter-authen-72dd6.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7HdN-3K7Lic1WjHojrScjgGyLdvCzgbg',
    appId: '1:995274508849:ios:a59612354bdf22bf33a310',
    messagingSenderId: '995274508849',
    projectId: 'flutter-authen-72dd6',
    storageBucket: 'flutter-authen-72dd6.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseAuthen',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7HdN-3K7Lic1WjHojrScjgGyLdvCzgbg',
    appId: '1:995274508849:ios:a59612354bdf22bf33a310',
    messagingSenderId: '995274508849',
    projectId: 'flutter-authen-72dd6',
    storageBucket: 'flutter-authen-72dd6.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseAuthen',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA7aHqtjFzniZ_DOJY8gUtA8fU6SXFiLqs',
    appId: '1:995274508849:web:302faa6ced63bb7f33a310',
    messagingSenderId: '995274508849',
    projectId: 'flutter-authen-72dd6',
    authDomain: 'flutter-authen-72dd6.firebaseapp.com',
    storageBucket: 'flutter-authen-72dd6.firebasestorage.app',
  );
}
