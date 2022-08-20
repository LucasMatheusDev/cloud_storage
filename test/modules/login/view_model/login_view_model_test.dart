import 'package:cloud_storage/modules/login/model/serializer/user_login_serializer.dart';
import 'package:cloud_storage/modules/login/view_model/login_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_view_model_test.mocks.dart';

@GenerateMocks([LoginViewModel])
void main() {
  group('login view model ', () {
    test("should make Login", () {
      final MockLoginViewModel mockLoginViewModel = MockLoginViewModel();
      final user = UserLoginSerializer().fake();

      when(mockLoginViewModel.login(user: user)).thenAnswer((_) async => true);

      expect(mockLoginViewModel.login, isNot(Exception));
      verifyNever(mockLoginViewModel.goToHomePage());
    });

    test("Don't should make Login", () {
      final MockLoginViewModel mockLoginViewModel = MockLoginViewModel();
      final user = UserLoginSerializer().fake();

      when(mockLoginViewModel.login(user: user))
          .thenAnswer((_) async => Exception);

      final result = verifyNever(mockLoginViewModel.goToHomePage());
      expect(true, result.callCount == 0);
    });
  });
}
