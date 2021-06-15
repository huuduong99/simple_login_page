import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_login_page/pages/home/home_page.dart';
import 'package:simple_login_page/pages/login/bloc/login_bloc.dart';
import 'package:simple_login_page/pages/login/bloc/login_event.dart';
import 'package:simple_login_page/pages/login/bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static const SizedBox sizebox = SizedBox(height: 30);
  final LoginBloc _loginBloc = LoginBloc();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginBloc,
      child: ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
            body: BlocConsumer<LoginBloc, LoginState>(
                listener: (BuildContext context, LoginState state) {
          if (state is LoginSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (context) => const HomePage()),
            );
          }else if(state is LoginFailure){
            _showSnackBar('Fail . Please login again ...!');
          }
        }, builder: (BuildContext context, LoginState state) {
          return Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    sizebox,
                    _buildUsername(),
                    const SizedBox(height: 10.0),
                    _buildPassword(),
                    _buildForgetPassword(),
                    sizebox,
                    _buildLoginButton(),
                    const SizedBox(height: 50.0),
                    _buildSignUpButton()
                  ],
                ),
              ));
        })),
      ),
    );
  }

  Widget _buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Username',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: const Color(0xFF6CA8F1),
              borderRadius: BorderRadius.circular(10.0),
              // ignore: always_specify_types
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 5))
              ]),
          height: 60.0,
          child: TextField(
              controller: _userNameController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(color: Colors.white54))),
        ),
      ],
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: const Color(0xFF6CA8F1),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 5))
              ]),
          height: 60.0,
          child: TextField(
              controller: _passwordController,
              obscureText: !_showPassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 14.0),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: _showPassword ? Colors.black12 : Colors.white,
                    ),
                    onPressed: () {
                      setState(() => _showPassword = !_showPassword);
                    },
                  ),
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(color: Colors.white54))),
        ),
      ],
    );
  }

  Widget _buildForgetPassword() {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot password'),
        child: const Text(
          'Forgot Password ?',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          FocusScope.of(context).unfocus();
          final String userName = _userNameController.text.trim().toString();
          final String password = _passwordController.text.trim().toString();
          _loginBloc
              .add(LoginButtonPressed(userName: userName, passWord: password));
        },
        padding: const EdgeInsets.all(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          'LOGIN',
          style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "You Don't have an account ?",
            style: TextStyle(color: Colors.white),
          ),
          FlatButton(
            onPressed: () {},
            child: const Text(
              'SIGN UP',
              style: TextStyle(fontSize: 15.0),
            ),
          )
        ],
      ),
    );
  }

  void _showSnackBar(String value) {
    _scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        content: Text(
          value,
        )));
  }
}
