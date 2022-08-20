import 'package:cloud_storage/core/config/analytics_error.dart';
import 'package:cloud_storage/core/config/firebase_initialize.dart';
import 'package:cloud_storage/modules/splash_screen/view_model/splash_screen_view_model.dart';
import 'package:get/get.dart';

/// This is the initial binding for the application
/// It is responsible for initializing the dependencies
/// application initials
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AnalyticsError>(
      AnalyticsError(),
    );
    Get.put<FirebaseInitialize>(
      FirebaseInitialize(),
    );

    Get.put<SplashScreenViewModel>(
      SplashScreenViewModel(),
    );
  }
}
