import 'package:simple_login_page/model/user.dart';

class AuthenticateService {
  Future<User> loginWithPassword({required String userName,required String passWord}) async {
    await Future.delayed(const Duration(milliseconds: 500), () {});

    if (userName == 'Lendy' && passWord == '1234') {
      return User(
          userName: 'Lendy',
          email: '1234@gmail.com',
          address: 'Hoang Van Thu',
          phoneNumber: '0333456789');
    }

    throw Exception('Account not exist .....!');
  }
}
