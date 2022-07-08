import 'package:flutter/material.dart';
import 'package:movil_app/components/already_have_an_account_check.dart';
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
    TextEditingController passwordTextController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Image.asset("assets/imgs/img_sesion.png",
              height: size.height * 0.45,
            ),
            RoundedInputField(
                hintText: "Correo electrónico",
                icon: Icons.email,
                onChanged: (value) {},
                controller: emailTextController
            ),
            RoundedInputField(
                hintText: "Contraseña",
                icon: Icons.lock,
                onChanged: (value) {},
                controller: passwordTextController
            ),
            RoundedButton(
              text: "Inciar Sesión",
              press: () {},
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {
              },
            ),

          ],
        ),
      ),
    );
  }
}
