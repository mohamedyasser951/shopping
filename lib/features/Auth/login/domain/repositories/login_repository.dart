import 'package:dartz/dartz.dart';
import 'package:shopping/Config/Error/failures.dart';
import 'package:shopping/features/Auth/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> userLogin(
      {required String userName, required String password});
}
