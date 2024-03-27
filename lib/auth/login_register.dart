import 'package:flutter/material.dart';
import '../login_page.dart';
import '../register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showloginpage = true;
  void tooglepage() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return LoginPage();
    } else {
      return RegisterPage();
    }
  }
}
