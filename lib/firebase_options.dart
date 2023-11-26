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
    apiKey: 'AIzaSyBu_cfYrZWVZq5ZrXATNK91Qmckj-ITvhg',
    appId: '1:446545002619:web:b20b35011e13b2575fa2de',
    messagingSenderId: '446545002619',
    projectId: 'eduvise-f3215',
    authDomain: 'eduvise-f3215.firebaseapp.com',
    storageBucket: 'eduvise-f3215.appspot.com',
    measurementId: 'G-LHN54HEC2Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4RsCTbxkYdutevEyoEzc4mTy5AqzYKyo',
    appId: '1:446545002619:android:e4d74a2fa5669dee5fa2de',
    messagingSenderId: '446545002619',
    projectId: 'eduvise-f3215',
    storageBucket: 'eduvise-f3215.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHxJdll5hB3JDwQEKuiivQJTZj9wTMYrA',
    appId: '1:446545002619:ios:b01c41c9e4a85e0c5fa2de',
    messagingSenderId: '446545002619',
    projectId: 'eduvise-f3215',
    storageBucket: 'eduvise-f3215.appspot.com',
    iosBundleId: 'com.example.eduvise',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHxJdll5hB3JDwQEKuiivQJTZj9wTMYrA',
    appId: '1:446545002619:ios:d545c924bc74f6585fa2de',
    messagingSenderId: '446545002619',
    projectId: 'eduvise-f3215',
    storageBucket: 'eduvise-f3215.appspot.com',
    iosBundleId: 'com.example.eduvise.RunnerTests',
  );
}
