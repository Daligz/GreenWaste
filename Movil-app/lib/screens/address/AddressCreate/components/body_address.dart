import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_button.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/components/bar.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:movil_app/service/service.dart';

class Body_Address extends StatelessWidget {
  final User? user;
  const Body_Address({
    Key? key,
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController coloniaTextController = TextEditingController();
    TextEditingController calleTextController = TextEditingController();
    TextEditingController numeroTextController = TextEditingController();
    TextEditingController municipioTextController = TextEditingController();
    TextEditingController estadoTextController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Bar(text:"Agregar Dirección", user: user, press: () {
              //Navigator.of(context).pushNamed('/main-screen', arguments: {'user': user!,},);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUser(user: user!)),);
            }),
            Image.asset("assets/imgs/address.png",
              height: size.height * 0.3,
            ),
            RoundedInputField(
                hintText: "Colonia",
                icon: Icons.home,
                onChanged: (value) {},
                controller: coloniaTextController
            ),
            RoundedInputField(
                hintText: "Calle",
                icon: Icons.home,
                onChanged: (value) {},
                controller: calleTextController
            ),
            RoundedInputField(
                hintText: "Numero Interior y Exterior",
                icon: Icons.tag,
                onChanged: (value) {},
                controller: numeroTextController
            ),
            RoundedInputField(
                hintText: "Municipio",
                icon: Icons.home,
                onChanged: (value) {},
                controller: municipioTextController
            ),
            RoundedInputField(
                hintText: "estado",
                icon: Icons.home,
                onChanged: (value) {},
                controller: estadoTextController
            ),
            RoundedButton(
              text: "Agregar Dirección",
              press: () {
                if(coloniaTextController.text.isNotEmpty && calleTextController.text.isNotEmpty &&
                    numeroTextController.text.isNotEmpty && municipioTextController.text.isNotEmpty &&
                    estadoTextController.text.isNotEmpty){
                  bool colonia = RegExp(r"^[a-zA-Z ]*$").hasMatch(coloniaTextController.text);
                  bool calle = RegExp(r"^[a-zA-Z ]*$").hasMatch(calleTextController.text);
                  bool numero = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]").hasMatch(numeroTextController.text);
                  bool minucipio = RegExp(r"^[a-zA-Z ]*$").hasMatch(municipioTextController.text);
                  bool estado = RegExp(r"^[a-zA-Z ]*$").hasMatch(estadoTextController.text);
                  if (colonia && calle && numero && minucipio && estado){
                    Service.createAddress(coloniaTextController.text, calleTextController.text, numeroTextController.text, municipioTextController.text,
                        estadoTextController.text,user!.idUsuario);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Éxito!"),));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Ingrese datos validos"),));

                  }
                } else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("No se ha crear la dirección, falta campos por llenar"),));
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
