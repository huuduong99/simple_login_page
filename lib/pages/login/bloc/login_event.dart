abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed({required this.userName, required this.passWord});

  final String userName;
  final String passWord;

  @override
  String toString() {
    return 'LoginButtonPressed(userName: $userName, passWord :$passWord)';
  }
}
