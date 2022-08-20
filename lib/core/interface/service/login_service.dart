import 'package:cloud_storage/core/model/entities/user.dart';

abstract class ILoginService {
  Future login({required UserEntity user});
  Future register({required UserEntity user});
}
