import 'package:cloud_storage/modules/login/model/serializer/user_login_serializer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('user login serializer', () {
    test('should make fake', () {
      final user = UserLoginSerializer().fake();
      expect(user, isNot(null));
      expect(user.email, isNot(null));
      expect(user.password, isNot(null));
    });

    test('should make from Json', () {
      final user = UserLoginSerializer().from({
        'email': 'email',
        'password': 'password',
      });
      expect(user, isNot(null));
      expect(user.email, 'email');
      expect(user.password, 'password');
    });

    test('should make to Json', () {
      final userFake = UserLoginSerializer().fake();
      final json = UserLoginSerializer().to(userFake);

      expect(UserLoginSerializer().from(json), userFake);
    });
  });
}
