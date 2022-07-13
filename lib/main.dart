import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_register/src/pages/home/home_page.dart';
import 'package:login_register/src/pages/login/login_page.dart';
import 'package:login_register/src/utils/colors.dart' as utils;

void main() async {
  //inicializar
  WidgetsFlutterBinding.ensureInitialized();
  //llamar a firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //initialize Firebase
  Future _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //para quitar la etiqueta
      title: 'Login Register',
      initialRoute: 'home',
      theme: ThemeData(
        fontFamily: 'NimbusSans',
        appBarTheme:
            const AppBarTheme(color: utils.Colors.color1, elevation: 0),
      ),

      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => const LoginPage(),
        //'register': (BuildContext context) => RegisterPage(),
      },
    );
  }
}
