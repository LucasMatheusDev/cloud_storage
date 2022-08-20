import 'dart:io';

import 'package:cloud_storage/modules/home/view_model/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gallery/gallery.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController with StateMixin<List<String>?> {
  final HomeViewModel _homeViewModel;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  List<String>? images = [];

  HomeViewController({
    required HomeViewModel homeViewModel,
  }) : _homeViewModel = homeViewModel {
    getStorageImages();
  }

  Future<void> uploadFile({
    required File file,
  }) async {
    change(null, status: RxStatus.loading());
    final bool wasUploaded = await _homeViewModel.uploadFile(
      file: file,
    );
    if (wasUploaded) {
      await getStorageImages();
    } else {
      change(
        images,
        status: images!.isEmpty ? RxStatus.empty() : RxStatus.success(),
      );
    }
  }

  Future<void> getStorageImages() async {
    change(null, status: RxStatus.loading());
    images = await _homeViewModel.getStorageImages();
    if (images != null) {
      change(
        images,
        status: images!.isEmpty ? RxStatus.empty() : RxStatus.success(),
      );
    } else {
      change(images, status: RxStatus.error());
    }
  }

  Future<void> deleteImage({
    required String imageUrl,
  }) async {
    change(images, status: RxStatus.loading());
    final bool wasDeleted = await _homeViewModel.deleteImage(
      urlImage: imageUrl,
    );
    if (wasDeleted) {
      images = images?.where((url) => url != imageUrl).toList();
    }
    change(
      images,
      status: images!.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );
  }

  Future<void> selectedImageFromGallery() async {
    Gallery gallery = Gallery();
    // Todo - implement selectedImageFromGallery
    final String? file = await gallery.openGallery();
    if (file != null && file.isNotEmpty) {
      await uploadFile(file: File(file));
    } else {
      change(
        images,
        status: images!.isEmpty ? RxStatus.empty() : RxStatus.success(),
      );
    }
  }

  Future<void> logout() async {
    await _homeViewModel.logout();
  }
}
