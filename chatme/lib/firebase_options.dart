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
    apiKey: 'AIzaSyCvDVlTiKb9y3hNAtQAAl42DyBYvOOyV2U',
    appId: '1:431586070612:web:926aa8729f6a9117a81dc1',
    messagingSenderId: '431586070612',
    projectId: 'chatme-9cc24',
    authDomain: 'chatme-9cc24.firebaseapp.com',
    storageBucket: 'chatme-9cc24.appspot.com',
    measurementId: 'G-HQHBVY2MB1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-jMG18TbUZIKU6Kg9ZVth3Gjem05NcRA',
    appId: '1:431586070612:android:132419889b9d2965a81dc1',
    messagingSenderId: '431586070612',
    projectId: 'chatme-9cc24',
    storageBucket: 'chatme-9cc24.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdqCiqzPizwKzJU8hobBQT57frnK9_VxA',
    appId: '1:431586070612:ios:83a7d58d986738c1a81dc1',
    messagingSenderId: '431586070612',
    projectId: 'chatme-9cc24',
    storageBucket: 'chatme-9cc24.appspot.com',
    iosClientId: '431586070612-p68t62gd58iv27sn8uldgb9vtt7og0o7.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatme',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdqCiqzPizwKzJU8hobBQT57frnK9_VxA',
    appId: '1:431586070612:ios:ed3e48cac3976cb0a81dc1',
    messagingSenderId: '431586070612',
    projectId: 'chatme-9cc24',
    storageBucket: 'chatme-9cc24.appspot.com',
    iosClientId: '431586070612-j6mqdq0c1l1r4adrmt788c06g6vd2g8q.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatme.RunnerTests',
  );
}
