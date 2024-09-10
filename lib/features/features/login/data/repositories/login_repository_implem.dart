import 'package:dartz/dartz.dart';
import 'package:shopping/Config/Error/exception.dart';
import 'package:shopping/Config/Error/failures.dart';
import 'package:shopping/features/features/login/data/datasources/login_data_source.dart';
import 'package:shopping/features/features/login/domain/entities/login_entity.dart';
import 'package:shopping/features/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImplement implements LoginRepository {
  LoginDataSource loginDataSource;
  LoginRepositoryImplement({
    required this.loginDataSource,
  });

  @override
  Future<Either<Failure, LoginEntity>> userLogin(
      {required String userName, required String password}) async {
    try {
      final userLogin =
          await loginDataSource.userLogin(name: userName, password: password);
      return right(userLogin);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
