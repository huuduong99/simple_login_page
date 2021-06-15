import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_login_page/model/user.dart';
import 'package:simple_login_page/pages/login/bloc/login_event.dart';
import 'package:simple_login_page/pages/login/bloc/login_state.dart';
import 'package:simple_login_page/service/authenticate_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({AuthenticateService? authenticateService})
      : super(LoginLoading()) {
    _authenticateService = authenticateService ?? AuthenticateService();
  }

  late AuthenticateService _authenticateService;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      try {
        final User user = await _authenticateService.loginWithPassword(
            userName: event.userName, passWord: event.passWord);

        yield LoginSuccess(user);
      } catch (e) {
        yield LoginFailure(e.toString());
      }
    }
  }
}
