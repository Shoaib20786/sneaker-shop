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
    apiKey: 'AIzaSyDoYnDuk2aJNrnZzhWUO2pPTyXHuSoWHII',
    appId: '1:483072787583:web:843bfe3386f29b52c5eb4a',
    messagingSenderId: '483072787583',
    projectId: 'sneakershop-822eb',
    authDomain: 'sneakershop-822eb.firebaseapp.com',
    storageBucket: 'sneakershop-822eb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGovv0EIBLdkcSv-xcp67qItiUDSVKL8I',
    appId: '1:483072787583:android:c6acedbf4613cbf5c5eb4a',
    messagingSenderId: '483072787583',
    projectId: 'sneakershop-822eb',
    storageBucket: 'sneakershop-822eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAI7aI4u3q4NB7T_t5NxSAparlxupBm_ys',
    appId: '1:483072787583:ios:df370ff54050fc85c5eb4a',
    messagingSenderId: '483072787583',
    projectId: 'sneakershop-822eb',
    storageBucket: 'sneakershop-822eb.appspot.com',
    iosBundleId: 'com.example.sneakerShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAI7aI4u3q4NB7T_t5NxSAparlxupBm_ys',
    appId: '1:483072787583:ios:df370ff54050fc85c5eb4a',
    messagingSenderId: '483072787583',
    projectId: 'sneakershop-822eb',
    storageBucket: 'sneakershop-822eb.appspot.com',
    iosBundleId: 'com.example.sneakerShop',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDoYnDuk2aJNrnZzhWUO2pPTyXHuSoWHII',
    appId: '1:483072787583:web:320ddc962618d3abc5eb4a',
    messagingSenderId: '483072787583',
    projectId: 'sneakershop-822eb',
    authDomain: 'sneakershop-822eb.firebaseapp.com',
    storageBucket: 'sneakershop-822eb.appspot.com',
  );
}
