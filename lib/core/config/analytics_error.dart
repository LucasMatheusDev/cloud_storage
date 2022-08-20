import 'dart:async';

import 'package:cloud_storage/core/config/firebase_initialize.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Custom FlutterError to handle the error reporting.
class AnalyticsError {
  void _initCrashlytics() {
    while (FirebaseInitialize().initialized == false) {
      Future.delayed(const Duration(milliseconds: 100));
    }
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  /// This method is used to report the error to the Firebase Crashlytics.
  ///
  /// This method wrap the [runZonedGuarded] method to handle
  /// the error reporting.
  Future<void> zoneGuarded(
    Future<void> Function() safeFunction,
  ) async {
    runZonedGuarded(
      () async {
        await safeFunction();
        _initCrashlytics;
      },
      (error, stackTrace) async {
        kDebugMode
            ? null
            : await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      },
    );
  }
}
