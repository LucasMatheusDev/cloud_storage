import 'package:cloud_storage/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

/// Init the configs the Firebase
class FirebaseInitialize {
  bool _initialized = false;

  bool get initialized => _initialized;

  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).whenComplete(() => _initialized = true);
  }
}
