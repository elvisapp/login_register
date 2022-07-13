import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:login_register/src/utils/colors.dart' as utils;
import 'package:login_register/src/widgets/button_app.dart';
import 'package:login_register/src/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('INIT STATE');

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('METODO BUILD');

    _con.init(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _textDescription(),
            _textLogin(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.17),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(),
            _textDontHaveAccount()
          ],
        ),
      ),
    );
  }

  Widget _bannerApp() {
    return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        color: utils.Colors.color1,
        height: MediaQuery.of(context).size.height * 0.22,
        child: Row(
          //Fila
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //margenes
          children: [
            Image.asset(
              'assets/img/logo_app.png',
              width: 150,
              height: 100,
            ),
            // ignore: prefer_const_constructors
            Text(
              'Bienvenido!',
              style: const TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22,
                  fontWeight: FontWeight.w700 //se puede colocar bold
                  ),
            )
          ],
        ),
      ),
    );
  }

  //Metodo es desir lo que hace

  Widget _textDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical:
              10), // margen para todos los lados aula 16 tipos de margen minuto 5:47
      child: const Text(
        'Continua con tu',
        style: TextStyle(color: Colors.black54, fontFamily: 'NimbusSans'),
      ),
    );
  }

  Widget _textLogin() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    // para introducir e-mail ojo
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.emailController,
        decoration: const InputDecoration(
            hintText: 'correo@gmail.com',
            labelText: 'Correo electronico',
            suffixIcon: Icon(
              // iconos recuerdas que hay varios
              Icons.email_outlined,
              color: utils.Colors.color1,
            )),
      ),
    );
  }

  Widget _textFieldPassword() {
    // para introducir e-mail ojo
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        obscureText: true, //metodo para esconder lo que se escribe
        controller: _con.passwordController,
        decoration: const InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: Icon(
              // iconos recuerdas que hay varios
              Icons.lock_open_outlined,
              color: utils.Colors.color1,
            )),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
        onPressed: _con.login,
        text: 'Iniciar sesion',
        color: utils.Colors.color1,
        textColor: Colors.white,
        //icon: Icons.xxxx, si activo este comando puedo cambiar el icono solo colocando el nombre en las xxx
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return GestureDetector(
      //onTap: _goToRegisterPage,
      child: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: const Text(
          '¿No tienes cuenta?',
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ),
    );
  }

  loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) {}

  //Metodo para ir a otra pagina

}
