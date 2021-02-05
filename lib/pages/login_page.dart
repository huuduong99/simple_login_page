import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  static const sizebox = SizedBox(height: 30);

  loginWithDio(String username, String password) async {
    var url = 'https://tmt18.tpos.vn/token';
    var dio = Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded; charset=UTF-8';
    try{
      Response response = await dio.post(url,data: {
        'username':username,
        'password':password,
        'grant_type':'password',
        'client_id':'tmtWebApp',
      });
      print(response.data);

    }catch(e){
      print(e);
    }

  }

  Widget _buildEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget> [
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFF6CA8F1),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0,5)
              )]
          ),
          height: 60.0,
          child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                      color: Colors.white54
                  )
              )
          ),
        ),
      ],
    );
  }

  Widget _buildPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget> [
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFF6CA8F1),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0,5)
              )]
          ),
          height: 60.0,
          child: TextField(
              controller: passwordController,
              obscureText: !this._showPassword,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showPassword ? Colors.black12 : Colors.white,
                    ),
                    onPressed: (){
                      setState(() => this._showPassword = !this._showPassword);
                    },
                  ),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                      color: Colors.white54
                  )
              )
          ),
        ),
      ],
    );
  }

  Widget _buildForgetPassword(){
    return  Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot password'),
        child: Text(
          'Forgot Password ?',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget _buildButtonLogin(){
    return Container(
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: (){loginWithDio(emailController.text,passwordController.text);},
        padding: EdgeInsets.all(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          "LOGIN",
          style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(){
    return Container(
      width: double.infinity,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Text(
            "You Don't have an account ?",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          FlatButton(
            onPressed: (){loginWithDio(emailController.text,passwordController.text);},
            child: Text(
              'SIGN UP',
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                sizebox,
                _buildEmail(),
                SizedBox(height: 10.0),
                _buildPassword(),
                _buildForgetPassword(),
                sizebox,
                _buildButtonLogin(),
                SizedBox(height: 50.0),
                _buildSignUpButton()
              ],
            ),
          )
      ) ,
    );
  }
}
