import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:login_register/src/pages/home/home_controller.dart';

// esta es la clase que de la pagina

class HomePage extends StatelessWidget {
  // este se utiliza cuando el estado es estatico
  //const
  HomePage({Key? key}) : super(key: key);
  HomeController _con = new HomeController();

  @override
  Widget build(BuildContext context) {
    _con.init(context); // inicializando el controlador
    return Scaffold(
      //aqui se declara todo lo que va en la estructura de la pagina
      //backgroundColor: Colors.black, color para toda la pagina
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black, Colors.purple, Colors.lightBlue])),
            child: Column(
              children: [
                _bannerApp(context),
                SizedBox(height: 50),
                _textSelectYourRol(),
                SizedBox(height: 30),
                _imageTypeUser(context, 'assets/img/pasajero.png'),
                SizedBox(height: 10),
                _textTypeUser('Cliente'),
                SizedBox(height: 30),
                _imageTypeUser(context, 'assets/img/driver.png'),
                SizedBox(height: 10),
                _textTypeUser('Funcionario'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.22),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Metodo para el banner

  Widget _bannerApp(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.30,
        child: Row(
          //esto es una lista recoradndo que abjo puedo cambiar a child para un solo elemento
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Image.asset(
              'assets/img/logo_app.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Pagina Principal',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  //Metodo para selecciona tu Rol
  Widget _textSelectYourRol() {
    return Text(
      'SELECCIONA TU ROL',
      style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'OneDay'),
    );
  }

  //Metodo para las imagenes

  Widget _imageTypeUser(BuildContext context, String image) {
    return GestureDetector(
      onTap: _con.goToLoginPage,
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 50,
        backgroundColor: Colors.grey[900],
      ),
    );
  }

  //Metodo para el Texto

  Widget _textTypeUser(String typeUser) {
    return Text(
      typeUser,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}
