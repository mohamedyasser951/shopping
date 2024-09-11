import 'package:get_it/get_it.dart';
import 'package:shopping/Config/network/internet_checker.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shopping/features/Auth/login/data/datasources/login_data_source.dart';
import 'package:shopping/features/Auth/login/data/repositories/login_repository_implem.dart';
import 'package:shopping/features/Auth/login/domain/repositories/login_repository.dart';
import 'package:shopping/features/Auth/login/presentation/bloc/login_bloc.dart';
import 'package:shopping/features/Home/PresentationLayer/bloc/home_bloc_bloc.dart';
import 'package:shopping/features/features/carts/data/datasources/remote_data_source.dart';
import 'package:shopping/features/features/carts/data/repositories/cart_repo_implements.dart';
import 'package:shopping/features/features/carts/domain/repositories/cart_repository.dart';
import 'package:shopping/features/features/carts/domain/usecases/get_all_carts_usecase.dart';
import 'package:shopping/features/features/carts/presentation/bloc/carts_bloc.dart';

GetIt sl = GetIt.instance;
void init() async {
  //BLOCS
  sl.registerFactory<LoginBloc>(() => LoginBloc(loginRepository: sl()));
  sl.registerFactory<HomeBloc>(() => HomeBloc());
  sl.registerFactory<CartsBloc>(() => CartsBloc(getAllCartsUsecase: sl()));

//UseCase
  sl.registerLazySingleton<GetAllCartsUsecase>(
      () => GetAllCartsUsecase(cartRepository: sl()));

  //REPOSITORIES
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImplement(loginDataSource: sl()));
  sl.registerLazySingleton<CartRepository>(
      () => CartRepoImplements(remoteDataSource: sl(), internetChecker: sl()));
  //Data Sources
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSource());
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => RemoteDataSourceImplem());

   sl.registerLazySingleton<InternetCheckerImplem>(() => InternetCheckerImplem());
}
