import 'package:cloud_storage/core/interface/service/cloud_storage_service.dart';
import 'package:cloud_storage/modules/home/model/service/cloud_storage_service_imp.dart';
import 'package:cloud_storage/modules/home/view/home_view_controller.dart';
import 'package:cloud_storage/modules/home/view_model/home_view_model.dart';
import 'package:get/get.dart';

class HomeViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICloudStorageService>(
      () => CloudStorageServiceImp(),
    );
    Get.lazyPut<HomeViewController>(
      () => HomeViewController(
        homeViewModel: Get.find<HomeViewModel>(),
      ),
    );

    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(
        cloudStorageService: Get.find<ICloudStorageService>(),
      ),
    );
  }
}
