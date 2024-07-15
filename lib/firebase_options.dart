import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDCQ-Q_Xt0-wY33tGfPEv6PdrVEJM8rgD8',
    appId: '1:851034696531:android:3efde03c5d4319083d4fa6',
    messagingSenderId: '851034696531',
    projectId: 'flutter-spotify-54063',
    storageBucket: 'flutter-spotify-54063.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmhm2EmCB-CsYkulXNRMtM6E-rX6qJ1E0',
    appId: '1:851034696531:ios:b5fbcfa7c0fe13843d4fa6',
    messagingSenderId: '851034696531',
    projectId: 'flutter-spotify-54063',
    storageBucket: 'flutter-spotify-54063.appspot.com',
    iosBundleId: 'com.way.spotifyFlutter',
  );
}