import 'package:cloud_storage/modules/login/model/serializer/new_user_serializer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(" New user Serializer ", () {
    test("Should make from a JSON", () {
      final newUser = NewUserSerializer().fake();
      final json = {
        'nickname': newUser.nickname,
        'email': newUser.email,
        'password': newUser.password,
      };

      expect(NewUserSerializer().from(json), newUser);
    });

    test("Should make a Json from NewUser", () {
      final newUser = NewUserSerializer().fake();
      final json = {
        'nickname': newUser.nickname,
        'email': newUser.email,
        'password': newUser.password,
      };

      expect(NewUserSerializer().to(newUser), json);
    });
  });
}
