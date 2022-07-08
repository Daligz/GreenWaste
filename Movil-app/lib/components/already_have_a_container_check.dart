import 'package:flutter/material.dart';
import 'package:movil_app/constants.dart';

class AlreadyHaveAContainerCheck extends StatelessWidget{
  final bool newContainer;
  final void Function()? press;
  const AlreadyHaveAContainerCheck({
    Key? key,
    this.newContainer = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          newContainer ? "¿Necesitas otro contenedor? " : "¿No necesitas un contenedor? ",
          style: TextStyle(color: kTextColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            newContainer ? "Solicitar" : "Regresar",
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