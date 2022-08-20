import 'package:cloud_storage/core/interface/serializer.dart';
import 'package:cloud_storage/modules/login/model/dto/user_login_dto.dart';
import 'package:faker/faker.dart';

class UserLoginSerializer
    implements Serializer<UserLoginDto, Map<String, String>> {
  @override
  UserLoginDto fake() {
    return UserLoginDto(
      email: faker.internet.email(),
      password: faker.internet.password(),
    );
  }

  @override
  UserLoginDto from(Map<String, String> json) {
    return UserLoginDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  @override
  Map<String, String> to(UserLoginDto object) {
    return {
      'email': object.email,
      'password': object.password,
    };
  }
}
