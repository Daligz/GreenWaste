import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_button.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/components/rounded_password_field.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/components/already_have_a_container_check.dart';
import 'package:movil_app/components/text_field_container.dart';
import 'package:movil_app/constants.dart';
import 'package:movil_app/screens/login/login.dart';
import 'package:movil_app/screens/signup/signup.dart';
import '../../../components/already_have_an_account_check.dart';
import 'package:movil_app/service/service.dart';


class BodySignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameTextController = TextEditingController();
    TextEditingController lastname1TextController = TextEditingController();
    TextEditingController lastname2TextController = TextEditingController();
    TextEditingController phoneTextController = TextEditingController();
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
            Image.asset("assets/imgs/img_main.png",
              height: size.height * 0.2,
            ),
            RoundedInputField(
                hintText: "Nombre",
                icon: Icons.account_circle_rounded,
                onChanged: (value) {},
                controller: nameTextController
            ),
            RoundedInputField(
                hintText: "Apellido Paterno",
                icon: Icons.contact_mail_rounded,
                onChanged: (value) {},
                controller: lastname1TextController
            ),
            RoundedInputField(
                hintText: "Apellido Materno",
                icon: Icons.contact_mail_rounded,
                onChanged: (value) {},
                controller: lastname2TextController
            ),
            RoundedInputField(
                hintText: "T??lefono",
                icon: Icons.local_phone_rounded,
                onChanged: (value) {},
                controller: phoneTextController
            ),
            RoundedInputField(
                hintText: "Correo electr??nico",
                icon: Icons.email,
                onChanged: (value) {},
                controller: emailTextController
            ),
            RoundedPasswordField(
                onChanged: (value) {},
                controller: passwordTextController
            ),
            RoundedButton(
              text: "Reg??strate",
              press: () {
                if(nameTextController.text.isNotEmpty && lastname1TextController.text.isNotEmpty &&
                    lastname2TextController.text.isNotEmpty && phoneTextController.text.isNotEmpty &&
                    emailTextController.text.isNotEmpty && passwordTextController.text.isNotEmpty){
                  Service.createUser(nameTextController.text, lastname1TextController.text, lastname2TextController.text,
                      phoneTextController.text, emailTextController.text, passwordTextController.text);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("??xito!"),));
                } else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("No se ha podido crear el usuario, falta campos por llenar"),));
                }
              },
            ),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
            SizedBox(height: size.height * 0.04),
          ],
        ),
      ),
    );
  }
}
