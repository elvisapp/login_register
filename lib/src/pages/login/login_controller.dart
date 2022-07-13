import 'package:flutter/material.dart';
import 'package:login_register/src/providers/auth_provider.dart';

class LoginController {
  BuildContext? context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  AuthProvider? _authProvider;

  Future? init(BuildContext context) {
    this.context = context;
    _authProvider = new AuthProvider();
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    try {
      bool islogin = await _authProvider!.login(email, password);
      if (islogin) {
        print('El usuario esta logeado');
      } else {
        print('El usuario no se pudo autenticar');
      }
    } catch (error) {
      print('error: $error');
    }
  }
}
