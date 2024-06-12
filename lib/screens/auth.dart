import 'package:memoir_vault/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:memoir_vault/screens/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;

  void _toggleAuth() {
    setState(() {
      isLogin = !isLogin;
      print(isLogin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            // 'assets/images/login.jpeg',
            // 'assets/images/bg.jpg',
            // 'assets/images/bg1.jpg',
            // 'assets/images/bg2.jpg',
            'assets/images/bg3.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          if (isLogin)
            LoginPage(toggleAuth: _toggleAuth)
          else
            SignUpPage(toggleAuth: _toggleAuth),
        ],
      ),
    );
  }
}
