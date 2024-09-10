import 'package:dartz/dartz.dart';
import 'package:shopping/Config/Error/failures.dart';
import 'package:shopping/features/features/login/domain/entities/login_entity.dart';
import 'package:shopping/features/features/login/domain/repositories/login_repository.dart';

class UserLoginUseCase {
  LoginRepository loginRepository;
  UserLoginUseCase({
    required this.loginRepository,
  });

  Future<Either<Failure, LoginEntity>> call(
      {required String userName, required String password}) async {
    return await loginRepository.userLogin(
        userName: userName, password: password);
  }
}
