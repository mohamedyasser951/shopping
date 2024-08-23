part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginEntity loginEntity;
  const LoginSuccess({
    required this.loginEntity,
  });
  @override
  List<Object> get props => [loginEntity];
}

class LoginErrorState extends LoginState {
  final String errorMessage;
  const LoginErrorState({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}
