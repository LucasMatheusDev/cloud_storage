import 'package:cloud_storage/core/model/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserLoginDto extends UserEntity with EquatableMixin {
  UserLoginDto({
    required super.email,
    required super.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
