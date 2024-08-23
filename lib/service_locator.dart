import 'package:get_it/get_it.dart';
import 'package:shopping/features/Auth/features/login/data/datasources/login_data_source.dart';
import 'package:shopping/features/Auth/features/login/data/repositories/login_repository_implem.dart';
import 'package:shopping/features/Auth/features/login/domain/repositories/login_repository.dart';
import 'package:shopping/features/Auth/features/login/presentation/bloc/login_bloc.dart';
import 'package:shopping/features/Home/PresentationLayer/bloc/home_bloc_bloc.dart';

GetIt sl = GetIt.instance;
void init() async {
  //BLOCS
  sl.registerFactory<LoginBloc>(() => LoginBloc(loginRepository: sl()));
  sl.registerFactory<HomeBloc>(() => HomeBloc());

  //REPOSITORIES
  sl.registerFactory<LoginRepository>(
      () => LoginRepositoryImplement(loginDataSource: sl()));

  //Data Sources
  sl.registerFactory<LoginDataSource>(() => LoginDataSource());
}
