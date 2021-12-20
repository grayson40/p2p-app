// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDs91y9meTLvQ-0Kgj7a7NVimHKMprEDEA',
    appId: '1:547749908247:android:b9ee546aad51258757b152',
    messagingSenderId: '547749908247',
    projectId: 'userpasswordauth',
    storageBucket: 'userpasswordauth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_YNN9Bx1BzvxsMYgMVR9Ryee7RLx6sOA',
    appId: '1:547749908247:ios:bca27d5c94a4763f57b152',
    messagingSenderId: '547749908247',
    projectId: 'userpasswordauth',
    storageBucket: 'userpasswordauth.appspot.com',
    iosClientId: '547749908247-gi8sq5fmcdv52l7aij3tcrm8iej974kb.apps.googleusercontent.com',
    iosBundleId: 'com.p',
  );
}
