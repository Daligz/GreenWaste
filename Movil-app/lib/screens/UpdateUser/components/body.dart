import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_button.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/components/bar.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController nameTextController = TextEditingController();
    TextEditingController lastNameTextController = TextEditingController();
    TextEditingController lastName2TextController = TextEditingController();
    TextEditingController phoneTextController = TextEditingController();
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Bar(text:"Editar perfil", press: () {

            }),
            Image.asset("assets/imgs/img_agregarContenedor_movil.png",
              height: size.height * 0.45,
            ),
            RoundedInputField(
                hintText: "Nombre",
                icon: Icons.account_circle,
                onChanged: (value) {},
                controller: nameTextController
            ),
            RoundedInputField(
                hintText: "Apellido paterno",
                icon: Icons.switch_account_sharp,
                onChanged: (value) {},
                controller: lastNameTextController
            ),
            RoundedInputField(
                hintText: "Apellido materno",
                icon: Icons.switch_account_sharp,
                onChanged: (value) {},
                controller: lastName2TextController
            ),
            RoundedInputField(
                hintText: "Teléfono",
                icon: Icons.local_phone_rounded,
                onChanged: (value) {},
                controller: phoneTextController
            ),
            RoundedInputField(
                hintText: "Correo electrónico",
                icon: Icons.email,
                onChanged: (value) {},
                controller: passwordTextController
            ),
            RoundedInputField(
                hintText: "Contraseña",
                icon: Icons.lock,
                onChanged: (value) {},
                controller: passwordTextController
            ),
            RoundedButton(
              text: "Guarddar",
              press: () {},
            ),
            SizedBox(height: size.height * 0.02),

          ],
        ),
      ),
    );
  }
}
