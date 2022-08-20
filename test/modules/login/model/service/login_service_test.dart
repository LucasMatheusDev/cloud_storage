import 'package:cloud_storage/core/interface/service/login_service.dart';
import 'package:cloud_storage/modules/login/model/serializer/user_login_serializer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_service_test.mocks.dart';

@GenerateMocks([ILoginService])
void main() {
  group('login service ', () {
    test("should make Login", () async {
      final MockILoginService mockILoginService = MockILoginService();
      final user = UserLoginSerializer().fake();
      when(mockILoginService.login(user: user)).thenAnswer((_) async => true);
      final result = await mockILoginService.login(user: user);
      expect(result, isNot(null));
    });
    test("Don't should make Login", () async {
      final MockILoginService mockILoginService = MockILoginService();
      final user = UserLoginSerializer().fake();
      when(mockILoginService.login(user: user))
          .thenAnswer((_) async => Exception);
      final result = await mockILoginService.login(user: user);
      expect(result, Exception);
    });
  });
}
