import 'package:cloud_storage/core/bindings/home_view_bindings.dart';
import 'package:cloud_storage/core/bindings/login_bindings.dart';
import 'package:cloud_storage/modules/home/view/home_view.dart';
import 'package:cloud_storage/modules/login/view/login/login_view.dart';
import 'package:cloud_storage/modules/splash_screen/splash_screen_view.dart';
import 'package:get/get.dart';

/// This Class is responsible for configuring all pages of the application,
/// adding the corresponding bindings to the pages and setting the routes.
class RoutesConfig {
  List<GetPage> getPages() {
    return [
      GetPage(
        name: '/',
        page: () => const SplashScreenView(),
      ),
      GetPage(
        name: '/home',
        page: () => const HomeView(),
        binding: HomeViewBindings(),
      ),
      GetPage(
        name: '/login',
        page: () => const LoginView(),
        binding: LoginBindings(),
      ),
    ];
  }

  List<String> getPageNames() {
    return getPages().map((GetPage page) => page.name).toList();
  }
}
