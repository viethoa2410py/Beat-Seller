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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAK_HTyj88ajIdO02kVuxLZMyRCcCLvzdY',
    appId: '1:768977853381:android:79eb7c9039b68517e609ac',
    messagingSenderId: '768977853381',
    projectId: 'beat-seller',
    databaseURL: 'https://beat-seller-default-rtdb.firebaseio.com',
    storageBucket: 'beat-seller.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfJvf6bWWjnAiCP8Epkr3a8G305jTrrLM',
    appId: '1:768977853381:ios:df998fac11825480e609ac',
    messagingSenderId: '768977853381',
    projectId: 'beat-seller',
    databaseURL: 'https://beat-seller-default-rtdb.firebaseio.com',
    storageBucket: 'beat-seller.appspot.com',
    iosClientId:
        '768977853381-9e9m802j698o19gdt3fvnv31fp27vjd5.apps.googleusercontent.com',
    iosBundleId: 'com.viethoa.xstudio',
  );
}
