import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_button.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/components/rounded_password_field.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/components/already_have_a_container_check.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Text(
              "Perfil",
              style: Theme.of(context).textTheme.headline2,
            ),
            Image.asset("assets/imgs/img_main.png",
              height: size.height * 0.45,
            ),
            Text(
              "GREEN WASTE",
              style: Theme.of(context).textTheme.headline3,
            ),
            RoundedButton(
              text: "Cambiar cuenta",
              press: () {},
            ),
            RoundedButton(
              text: "Datos personales",
              press: () {},
            ),
            RoundedButton(
              text: "Direcciones",
              press: () {},
            ),
            RoundedButton(
              text: "Historial de recompensas",
              press: () {},
            ),
            RoundedButton(
              text: "Cerrar sesión",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
