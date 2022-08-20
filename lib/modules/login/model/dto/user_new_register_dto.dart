import 'package:cloud_storage/core/model/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserNewRegisterDto extends UserEntity with EquatableMixin {
  final String nickname;

  UserNewRegisterDto({
    required this.nickname,
    required super.email,
    required super.password,
  });

  @override
  List<Object?> get props => [
        nickname,
        super.email,
        super.password,
      ];
}
