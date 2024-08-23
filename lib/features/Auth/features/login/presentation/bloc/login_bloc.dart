import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Config/Error/failures.dart';
import 'package:shopping/Config/Strings/error_messages.dart';

import 'package:shopping/features/Auth/features/login/domain/entities/login_entity.dart';
import 'package:shopping/features/Auth/features/login/domain/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;
  LoginBloc(
    {required this.loginRepository,}
  ) : super(LoginInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      final data = await loginRepository.userLogin(
          userName: event.userName, password: event.password);
      data.fold(
          (failure) =>
              emit(LoginErrorState(errorMessage: mapFailureToMessage(failure))),
          (loginData) => emit(LoginSuccess(loginEntity: loginData)));
    });
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case (OfflineFailure):
        return OFFLINE_FAILURE_MESSAGE;
      case (ServerFailure):
        return SERVER_FAILURE_MESSAGE;
      case (EmptyCasheFailure):
        return EMPTY_CACHE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
