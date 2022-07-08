import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_button.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/components/rounded_password_field.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/components/already_have_a_container_check.dart';
import 'package:movil_app/components/text_field_container.dart';
import 'package:movil_app/constants.dart';
import 'package:movil_app/screens/login/login.dart';

class Body_Login extends StatelessWidget {

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
            Image.asset("assets/imgs/img_main.png",
              height: size.height * 0.45,
            ),
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Correo Electronico",
                  icon: Icon(
                    Icons.email,
                    color: kPrimaryDarkColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryDarkColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            RoundedButton(
              text: "Inciar Sesión",
              press: () {},
            ),
            RichText(
              text: TextSpan(
                text: '¿Aún no tiene cuenta? ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Crear Cuenta',
                      style:
                      TextStyle(
                          fontWeight: FontWeight.bold ,
                          color: kPrimaryColor)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
