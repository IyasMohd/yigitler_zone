import 'package:flutter/material.dart';
import 'package:yigitler_zone/screens/home_screen.dart';
import 'package:yigitler_zone/screens/login_screen.dart';

class Authenticate extends StatelessWidget {
  Authenticate({Key? key}) : super(key: key);

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return  HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
