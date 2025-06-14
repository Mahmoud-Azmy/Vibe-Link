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
    apiKey: 'AIzaSyBv-us8nWOyVQhWlccWYugK5EkWjbx3AvQ',
    appId: '1:742172189346:web:1b2c5d6db053c191c2edfb',
    messagingSenderId: '742172189346',
    projectId: 'vibe-link-cb482',
    authDomain: 'vibe-link-cb482.firebaseapp.com',
    storageBucket: 'vibe-link-cb482.firebasestorage.app',
    measurementId: 'G-JEZDGRLF9X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoxJn6CxEwp80cWQdZ_77Z82lKMtdicW4',
    appId: '1:742172189346:android:cfe84ea89802feb0c2edfb',
    messagingSenderId: '742172189346',
    projectId: 'vibe-link-cb482',
    storageBucket: 'vibe-link-cb482.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBycMWKIeHUSdTkvuW9CHPUnMXEPSgje7U',
    appId: '1:742172189346:ios:134eded9a11f160ec2edfb',
    messagingSenderId: '742172189346',
    projectId: 'vibe-link-cb482',
    storageBucket: 'vibe-link-cb482.firebasestorage.app',
    iosBundleId: 'com.example.vibeLink',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBycMWKIeHUSdTkvuW9CHPUnMXEPSgje7U',
    appId: '1:742172189346:ios:134eded9a11f160ec2edfb',
    messagingSenderId: '742172189346',
    projectId: 'vibe-link-cb482',
    storageBucket: 'vibe-link-cb482.firebasestorage.app',
    iosBundleId: 'com.example.vibeLink',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBv-us8nWOyVQhWlccWYugK5EkWjbx3AvQ',
    appId: '1:742172189346:web:4f7f8a36c4f248dac2edfb',
    messagingSenderId: '742172189346',
    projectId: 'vibe-link-cb482',
    authDomain: 'vibe-link-cb482.firebaseapp.com',
    storageBucket: 'vibe-link-cb482.firebasestorage.app',
    measurementId: 'G-BFZZ1QL2HJ',
  );
}
