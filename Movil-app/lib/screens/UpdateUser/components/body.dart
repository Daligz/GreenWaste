import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_button.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/components/rounded_password_field.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/components/bar.dart';
import 'package:movil_app/screens/Profile/profile_screen.dart';
import 'package:movil_app/screens/UpdateUser/update_user.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:movil_app/service/service.dart';

class Body extends StatelessWidget {
  final User? user;
  const Body({
    Key? key,
    required this.user
  }) : super(key: key);

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
            Bar(text:"Editar perfil", user: user, press: () {
              //Navigator.of(context).pushNamed('/main-screen', arguments: {'user': user!,},);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUser(user: user!)),);
            }),
            Image.asset("assets/imgs/img_editar_usuario_movil.png",
              height: size.height * 0.20,
            ),
            RoundedInputField(
                hintText: "Nombre",
                icon: Icons.account_circle_rounded,
                onChanged: (value) {},
                controller: nameTextController..text = user!.nombre ?? ""
            ),
            RoundedInputField(
                hintText: "Apellido paterno",
                icon: Icons.contact_mail_rounded,
                onChanged: (value) {},
                controller: lastNameTextController..text = user!.apellidoPaterno ?? ""
            ),
            RoundedInputField(
                hintText: "Apellido materno",
                icon: Icons.contact_mail_rounded,
                onChanged: (value) {},
                controller: lastName2TextController..text = user!.apellidoMaterno ?? ""
            ),
            RoundedInputField(
                hintText: "Teléfono",
                icon: Icons.local_phone_rounded,
                onChanged: (value) {},
                controller: phoneTextController..text = user!.telefono ?? ""
            ),
            RoundedInputField(
                hintText: "Correo electrónico",
                icon: Icons.email,
                onChanged: (value) {},
                controller: emailTextController..text = user!.correo ?? ""
            ),
            RoundedPasswordField(
                onChanged: (value) {},
                controller: passwordTextController..text = user!.psw ?? ""
            ),
            RoundedButton(
              text: "Guardar",
              press: () async {
                if(nameTextController.text.isNotEmpty && lastNameTextController.text.isNotEmpty &&
                    lastName2TextController.text.isNotEmpty && phoneTextController.text.isNotEmpty &&
                    emailTextController.text.isNotEmpty && passwordTextController.text.isNotEmpty){
                  bool valor = await Service.updateUser(user!.idUsuario, nameTextController.text, lastNameTextController.text, lastName2TextController.text,
                      phoneTextController.text, emailTextController.text, passwordTextController.text);
                 // User newUser = User(user!.idUsuario, nameTextController.text, lastNameTextController.text, lastName2TextController.text, phoneTextController.text, emailTextController.text, passwordTextController.text, 1);
                  if(valor != false){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Éxito!"),));
                    User? newUser = await Service.readUser(user!.idUsuario);
                    //Navigator.of(context).pushNamed('/main-screen', arguments: {'user': newUser!,},);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateUser(user: newUser!)));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Error al guardar al usuario!"),));
                  }

                } else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("No se ha podido crear el usuario, falta campos por llenar"),));
                }
              },
            ),
            SizedBox(height: size.height * 0.02),

          ],
        ),
      ),
    );
  }
}
