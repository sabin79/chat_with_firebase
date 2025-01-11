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
    apiKey: 'AIzaSyD273MzR5MeAo-VN_vv59uGERpoNWP7TVM',
    appId: '1:286192431576:web:d94379bfb67cc3f1c7c2ad',
    messagingSenderId: '286192431576',
    projectId: 'fir-chatapp-a5025',
    authDomain: 'fir-chatapp-a5025.firebaseapp.com',
    storageBucket: 'fir-chatapp-a5025.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDvCH619aSrfz9xgiC4rBiYYnSMvmPJXE',
    appId: '1:286192431576:android:9019d1dcfa2d8e08c7c2ad',
    messagingSenderId: '286192431576',
    projectId: 'fir-chatapp-a5025',
    storageBucket: 'fir-chatapp-a5025.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmsmQerjAKb3j1Owgm6bKIuoUKn441pHk',
    appId: '1:286192431576:ios:50921aa6bc7533adc7c2ad',
    messagingSenderId: '286192431576',
    projectId: 'fir-chatapp-a5025',
    storageBucket: 'fir-chatapp-a5025.firebasestorage.app',
    iosBundleId: 'com.example.chatWithFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmsmQerjAKb3j1Owgm6bKIuoUKn441pHk',
    appId: '1:286192431576:ios:50921aa6bc7533adc7c2ad',
    messagingSenderId: '286192431576',
    projectId: 'fir-chatapp-a5025',
    storageBucket: 'fir-chatapp-a5025.firebasestorage.app',
    iosBundleId: 'com.example.chatWithFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD273MzR5MeAo-VN_vv59uGERpoNWP7TVM',
    appId: '1:286192431576:web:b0bc915f14bab170c7c2ad',
    messagingSenderId: '286192431576',
    projectId: 'fir-chatapp-a5025',
    authDomain: 'fir-chatapp-a5025.firebaseapp.com',
    storageBucket: 'fir-chatapp-a5025.firebasestorage.app',
  );
}