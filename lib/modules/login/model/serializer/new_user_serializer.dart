import 'package:cloud_storage/core/interface/serializer.dart';
import 'package:cloud_storage/modules/login/model/dto/user_new_register_dto.dart';
import 'package:faker/faker.dart';

class NewUserSerializer
    implements Serializer<UserNewRegisterDto, Map<String, String>> {
  @override
  UserNewRegisterDto fake() {
    return UserNewRegisterDto(
      nickname: faker.person.name(),
      email: faker.internet.email(),
      password: faker.internet.password(),
    );
  }

  @override
  UserNewRegisterDto from(Map<String, String> json) {
    return UserNewRegisterDto(
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  @override
  Map<String, String> to(UserNewRegisterDto object) {
    return {
      'nickname': object.nickname,
      'email': object.email,
      'password': object.password,
    };
  }
}
