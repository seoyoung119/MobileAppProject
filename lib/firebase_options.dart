import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyB6-0dkQRKKPqVi-errOfuFxeV6zUF7PPY',
    appId: '1:7488195448:web:1e6357a82946dd6d70168d',
    messagingSenderId: '7488195448',
    projectId: 'cardmap-167f0',
    authDomain: 'cardmap-167f0.firebaseapp.com',
    storageBucket: 'cardmap-167f0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIC4v3lcYH8vgEr4bdgNvBxvzpRj0QPKc',
    appId: '1:7488195448:android:af9ec3a0fa30050370168d',
    messagingSenderId: '7488195448',
    projectId: 'cardmap-167f0',
    storageBucket: 'cardmap-167f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPfBM2JbHRHstttNT-tLMPGKDPKfcdBus',
    appId: '1:7488195448:ios:9a7ec9ce8783c38970168d',
    messagingSenderId: '7488195448',
    projectId: 'cardmap-167f0',
    storageBucket: 'cardmap-167f0.appspot.com',
    iosBundleId: 'com.example.projectCardmap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPfBM2JbHRHstttNT-tLMPGKDPKfcdBus',
    appId: '1:7488195448:ios:71beb4a3a00bfd1670168d',
    messagingSenderId: '7488195448',
    projectId: 'cardmap-167f0',
    storageBucket: 'cardmap-167f0.appspot.com',
    iosBundleId: 'com.example.projectCardmap.RunnerTests',
  );
}
