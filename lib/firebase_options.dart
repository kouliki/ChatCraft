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
    apiKey: 'AIzaSyBua7ojiJnLJ5J5J4NqaiUTQAdM8LvQddQ',
    appId: '1:605097180880:web:04dd26118f282a6721a8d5',
    messagingSenderId: '605097180880',
    projectId: 'chatapp-b4dc9',
    authDomain: 'chatapp-b4dc9.firebaseapp.com',
    storageBucket: 'chatapp-b4dc9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXPD0G7eBv3n2JJYAjIbWwXPUBbs7WvAA',
    appId: '1:605097180880:android:8e85a9a21a90146e21a8d5',
    messagingSenderId: '605097180880',
    projectId: 'chatapp-b4dc9',
    storageBucket: 'chatapp-b4dc9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEsRZYpfg8ds-5z4ORgc_62Ejok_u6B2s',
    appId: '1:605097180880:ios:8df35810d2c5c09921a8d5',
    messagingSenderId: '605097180880',
    projectId: 'chatapp-b4dc9',
    storageBucket: 'chatapp-b4dc9.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDEsRZYpfg8ds-5z4ORgc_62Ejok_u6B2s',
    appId: '1:605097180880:ios:8df35810d2c5c09921a8d5',
    messagingSenderId: '605097180880',
    projectId: 'chatapp-b4dc9',
    storageBucket: 'chatapp-b4dc9.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBua7ojiJnLJ5J5J4NqaiUTQAdM8LvQddQ',
    appId: '1:605097180880:web:199e2b79a7ab3be421a8d5',
    messagingSenderId: '605097180880',
    projectId: 'chatapp-b4dc9',
    authDomain: 'chatapp-b4dc9.firebaseapp.com',
    storageBucket: 'chatapp-b4dc9.appspot.com',
  );
}
