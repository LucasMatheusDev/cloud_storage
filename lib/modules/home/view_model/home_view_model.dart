import 'dart:io';

import 'package:cloud_storage/core/interface/service/cloud_storage_service.dart';
import 'package:cloud_storage/core/routes/custom_navigator.dart';
import 'package:cloud_storage/core/routes/named_routes.dart';
import 'package:cloud_storage/core/utils/alerts_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeViewModel {
  final ICloudStorageService _cloudStorageService;

  HomeViewModel({
    required ICloudStorageService cloudStorageService,
  }) : _cloudStorageService = cloudStorageService;

  Future<bool> uploadFile({required File file}) async {
    try {
      await _cloudStorageService.uploadNewImage(file: file);
      AlertsSnackbar().showSuccessSnackBar(
        message: 'Imagem Salva com sucesso',
      );
      return true;
    } catch (e) {
      AlertsSnackbar().showErrorSnackBar(
        errorMessage: "Erro ao fazer upload do arquivo",
        message: e.toString(),
      );
      return false;
    }
  }

  Future<List<String>?> getStorageImages() async {
    try {
      return await _cloudStorageService.getStorageImagesUrl();
    } catch (e) {
      AlertsSnackbar().showErrorSnackBar(
        errorMessage: "Erro ao carregar as imagens",
        message: e.toString(),
      );
      return null;
    }
  }

  Future<bool> deleteImage({required String urlImage}) async {
    try {
      await _cloudStorageService.deleteImage(urlImage: urlImage);
      AlertsSnackbar().showSuccessSnackBar(
        message: 'Imagem deletada com sucesso',
      );
      return true;
    } catch (e) {
      AlertsSnackbar().showErrorSnackBar(
        errorMessage: "Erro ao deletar a imagem",
        message: e.toString(),
      );
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      CustomNavigator().offNamed(NamedRoutes.login);
    } catch (e) {
      AlertsSnackbar().showErrorSnackBar(
        errorMessage: "Erro ao fazer logout",
        message: e.toString(),
      );
    }
  }
}
