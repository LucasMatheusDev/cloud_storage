import 'package:cloud_storage/core/config/firebase_initialize.dart';
import 'package:cloud_storage/core/routes/named_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

/// This class is responsible for starting some services,
///  checking if the user is
/// logged in and then forwards you to the correct page.
class SplashScreenViewModel {
  SplashScreenViewModel() {
    _loadInitConfigAndGoToPage();
  }

  Future<void> _loadInitConfigAndGoToPage() async {
    await _initialize();

    while (Get.find<FirebaseInitialize>().initialized == false) {
      await Future.delayed(const Duration(seconds: 1));
    }
    if (_hasUserLoggedIn()) {
      Get.offNamed(NamedRoutes.home);
    } else {
      Get.offNamed(NamedRoutes.login);
    }
  }

  Future<void> _initialize() async {
    await Get.find<FirebaseInitialize>().initialize();
  }

  bool _hasUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
