import 'package:cloud_storage/core/interface/service/login_service.dart';
import 'package:cloud_storage/core/model/entities/user.dart';
import 'package:cloud_storage/modules/login/model/dto/user_new_register_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// This class is responsible for [registerUser] and [loginUser].
class LoginServiceImp implements ILoginService {
  @override
  Future<User?> login({required UserEntity user}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    return auth.currentUser;
  }

  @override
  Future<User?> register({required UserEntity user}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    if (user is UserNewRegisterDto) {
      await auth.currentUser?.updateDisplayName(
        user.nickname,
      );
    }
    return auth.currentUser;
  }
}
