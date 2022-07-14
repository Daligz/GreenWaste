import 'package:flutter/material.dart';
import 'package:movil_app/components/already_have_an_account_check.dart';
import 'package:movil_app/components/rounded_button.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/components/rounded_password_field.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/screens/signup/signup.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:movil_app/service/service.dart';
import 'package:movil_app/screens/Profile/profile_screen.dart';

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
            RoundedPasswordField(
                onChanged: (value) {},
                controller: passwordTextController
            ),
            RoundedButton(
              text: "Inciar Sesión",
              press: () async {
                if(emailTextController.text.isNotEmpty && passwordTextController.text.isNotEmpty){
                  User? val1 = await Service.loginUser(emailTextController.text, passwordTextController.text);
                  print(val1);
                  if( val1 != null && val1.correo.isNotEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Bienvenido"),));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen(user: val1!)));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Verifique sus credenciales")));
                  }
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Todos los campos deben estar llenos")));
                }

              },
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
