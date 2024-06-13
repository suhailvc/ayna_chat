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
    apiKey: 'AIzaSyCY-Ifds2RecG154xiL7ZtK7sa7CRjZHEM',
    appId: '1:431932371122:web:185b7ab870cb2d845cd9ab',
    messagingSenderId: '431932371122',
    projectId: 'aynachat-afadc',
    authDomain: 'aynachat-afadc.firebaseapp.com',
    storageBucket: 'aynachat-afadc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYY2FKeuLj4yd-smK6iEOdm5BaUji-foo',
    appId: '1:431932371122:android:89ee550a431e6d765cd9ab',
    messagingSenderId: '431932371122',
    projectId: 'aynachat-afadc',
    storageBucket: 'aynachat-afadc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTsyOmAfAdai_BktdN8FPZo2-oDpY3B9A',
    appId: '1:431932371122:ios:1d7426f475cbfe775cd9ab',
    messagingSenderId: '431932371122',
    projectId: 'aynachat-afadc',
    storageBucket: 'aynachat-afadc.appspot.com',
    iosBundleId: 'com.example.aynaTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTsyOmAfAdai_BktdN8FPZo2-oDpY3B9A',
    appId: '1:431932371122:ios:1d7426f475cbfe775cd9ab',
    messagingSenderId: '431932371122',
    projectId: 'aynachat-afadc',
    storageBucket: 'aynachat-afadc.appspot.com',
    iosBundleId: 'com.example.aynaTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCY-Ifds2RecG154xiL7ZtK7sa7CRjZHEM',
    appId: '1:431932371122:web:62152e974946f8d75cd9ab',
    messagingSenderId: '431932371122',
    projectId: 'aynachat-afadc',
    authDomain: 'aynachat-afadc.firebaseapp.com',
    storageBucket: 'aynachat-afadc.appspot.com',
  );

}