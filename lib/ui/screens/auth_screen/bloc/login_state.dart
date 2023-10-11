part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggingIn extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailed extends LoginState {
  final String message;
  const LoginFailed(this.message);

  @override
  List<Object> get props => [];
}

class LoggedIn extends LoginState {
  final LoginResponse loginResponse;
  const LoggedIn(this.loginResponse);
  @override
  List<Object> get props => [];
}
