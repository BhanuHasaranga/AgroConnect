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
    apiKey: 'AIzaSyDhvni7vLOv_b8x_p6qqF3BfUrWck7Op-U',
    appId: '1:802746240653:web:3f097400b3f3bd12395cc4',
    messagingSenderId: '802746240653',
    projectId: 'agroconnect-4a482',
    authDomain: 'agroconnect-4a482.firebaseapp.com',
    storageBucket: 'agroconnect-4a482.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAr2nqqzN4BBFLdx8uOQ3TuaXdC8aqvqeY',
    appId: '1:802746240653:android:ef71ea3f09d17c2e395cc4',
    messagingSenderId: '802746240653',
    projectId: 'agroconnect-4a482',
    storageBucket: 'agroconnect-4a482.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLsk-0CsKMRL6jbk3PWoF3D9YDbuQ1m3M',
    appId: '1:802746240653:ios:d0ba871fc3b1c781395cc4',
    messagingSenderId: '802746240653',
    projectId: 'agroconnect-4a482',
    storageBucket: 'agroconnect-4a482.appspot.com',
    iosBundleId: 'com.example.agroConnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLsk-0CsKMRL6jbk3PWoF3D9YDbuQ1m3M',
    appId: '1:802746240653:ios:f80d19f7d748b4f1395cc4',
    messagingSenderId: '802746240653',
    projectId: 'agroconnect-4a482',
    storageBucket: 'agroconnect-4a482.appspot.com',
    iosBundleId: 'com.example.agroConnect.RunnerTests',
  );
}