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
    apiKey: 'AIzaSyCwVtiwASbT60rOoJ7GrU_UJF-ldPuWqo4',
    appId: '1:610672394069:web:2e622175fb192d289979dc',
    messagingSenderId: '610672394069',
    projectId: 'flutter-nature-photos',
    authDomain: 'flutter-nature-photos.firebaseapp.com',
    storageBucket: 'flutter-nature-photos.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSKYNvqVmXXG8hEke8HcSAUFwEj-D5_qM',
    appId: '1:610672394069:android:8f9f0ad0e82491609979dc',
    messagingSenderId: '610672394069',
    projectId: 'flutter-nature-photos',
    storageBucket: 'flutter-nature-photos.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8yYimHvndbRoPovrd89iwWZo7tooSbsE',
    appId: '1:610672394069:ios:4499da24a19451129979dc',
    messagingSenderId: '610672394069',
    projectId: 'flutter-nature-photos',
    storageBucket: 'flutter-nature-photos.appspot.com',
    iosClientId: '610672394069-kapvf8fai4hh3s8q3a3o53j3p7m8gm5j.apps.googleusercontent.com',
    iosBundleId: 'com.example.naturePhotos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8yYimHvndbRoPovrd89iwWZo7tooSbsE',
    appId: '1:610672394069:ios:e07130dea9609aaa9979dc',
    messagingSenderId: '610672394069',
    projectId: 'flutter-nature-photos',
    storageBucket: 'flutter-nature-photos.appspot.com',
    iosClientId: '610672394069-nivctm83b41cogiitks1fru54fmjik8j.apps.googleusercontent.com',
    iosBundleId: 'com.example.naturePhotos.RunnerTests',
  );
}
