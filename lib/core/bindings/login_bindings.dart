import 'package:cloud_storage/core/interface/service/login_service.dart';
import 'package:cloud_storage/modules/login/model/service/login_service_imp.dart';
import 'package:cloud_storage/modules/login/view/login/login_controller.dart';
import 'package:cloud_storage/modules/login/view_model/login_view_model.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(
      () => LoginViewModel(
        loginRepository: Get.find(),
      ),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginViewModel: Get.find(),
      ),
    );
    Get.lazyPut<ILoginService>(
      () => LoginServiceImp(),
    );
  }
}
