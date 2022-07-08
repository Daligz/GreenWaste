import 'package:flutter/material.dart';
import 'package:movil_app/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget{
  final bool login;
  final void Function()? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿Aún no tienes cuenta? " : "¿Tienes cuenta? ",
          style: TextStyle(color: kTextColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Crear cuenta" : "Iniciar sesión",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}