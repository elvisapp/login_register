import 'package:flutter/material.dart';
import 'package:login_register/src/utils/colors.dart' as utils;
//import 'package:login_register/src/pages/login/login_page.dart';

class ButtonApp extends StatelessWidget {
  // const ButtonApp({Key? key}) : super(key: key);

  Color color;
  Color textColor;
  String text;
  IconData icon;
  Function onPressed;

  ButtonApp(
      {this.color = Colors.black,
      this.textColor = Colors.white,
      this.icon = Icons.arrow_forward_ios,
      required this.onPressed,
      required this.text //texto obligatorio

      });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        onPressed();
      },
      color: color,
      textColor: textColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 50,
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  icon,
                  color: utils.Colors.color1,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
