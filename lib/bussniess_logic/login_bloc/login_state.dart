part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final Login loginResponse;
  final BuildContext context;

  LoginSuccess(this.loginResponse, this.context) {
    // Navigator.pushNamed(context, firstScreen);
  }
}

class LoginError extends LoginState {
  final Error_modle loginError;

  LoginError(this.loginError);
}

class LoginLoading extends LoginState {
  final bool isLoading;

  LoginLoading(this.isLoading);
}
