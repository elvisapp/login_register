import 'package:flutter/material.dart';

// el habla del problema nulo minuto 14:22 despues de las definicion de las clases

class HomeController {
  BuildContext? context; //variable
  // ignore: body_might_complete_normally_nullable
  Future? init(BuildContext contex) {
    //metodo
    // ignore: unnecessary_this
    this.context = contex;
  }

//Metodo para pasar de pagina agregando gestoDetec y luego onTap

  void goToLoginPage() {
    Navigator.pushNamed(context!, 'login');
  }
}
