import 'package:simple_login_page/model/user.dart';

abstract class LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginSuccess(this.user);

  final User user;

  @override
  String toString() {
    return 'LoginSuccess(user: $user)';
  }
}

class LoginFailure extends LoginState {
  LoginFailure(this.error);

  final String error;

  @override
  String toString() {
    return 'LoginFailure(error: $error)';
  }
}
