import 'package:cloud_storage/core/interface/service/login_service.dart';
import 'package:cloud_storage/core/model/entities/user.dart';
import 'package:cloud_storage/core/routes/custom_navigator.dart';
import 'package:cloud_storage/core/routes/named_routes.dart';
import 'package:cloud_storage/core/utils/alerts_snackbar.dart';
import 'package:cloud_storage/core/utils/helper/firebase_auth_error_translator_helper.dart';
import 'package:cloud_storage/modules/login/model/dto/user_new_register_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel {
  final ILoginService _loginService;

  LoginViewModel({
    required ILoginService loginRepository,
  }) : _loginService = loginRepository;

  Future<void> login({required UserEntity user}) async {
    try {
      final result = await _loginService.login(
        user: user,
      );
      if (result != null) {
        goToHomePage();
      }
    } on FirebaseAuthException catch (e) {
      return AlertsSnackbar().showErrorSnackBar(
        message:
            FirebaseAuthErrorTranslator().erroTranslator(errorCode: e.code),
        errorMessage: e.toString(),
      );
    } catch (e) {
      return AlertsSnackbar().showErrorSnackBar(
        message: "Tivemos um problema ao fazer o registro",
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> registerAndToHome({required UserNewRegisterDto user}) async {
    try {
      final result = await _loginService.register(
        user: user,
      );
      if (result != null) {
        goToHomePage();
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return AlertsSnackbar().showErrorSnackBar(
        message:
            FirebaseAuthErrorTranslator().erroTranslator(errorCode: e.code),
        errorMessage: e.toString(),
      );
    } catch (e) {
      return AlertsSnackbar().showErrorSnackBar(
        message: "Tivemos um problema ao registrar seu usuário",
        errorMessage: e.toString(),
      );
    }
  }

  void goToHomePage() =>
      CustomNavigator().goToRouteNamed(route: NamedRoutes.home);
}
