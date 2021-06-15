import 'package:flutter/material.dart';
import 'package:simple_login_page/pages/login/ui/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
      home : LoginPage()
  ));
}
