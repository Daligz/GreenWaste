import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_button.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/components/rounded_password_field.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/components/already_have_a_container_check.dart';
import 'package:movil_app/screens/UpdateUser/update_user.dart';
import 'package:movil_app/screens/address/AddressCreate/create_address.dart';
import 'package:movil_app/screens/login/login.dart';
import 'package:movil_app/service/common/address.dart';
import 'package:movil_app/service/common/user.dart';

import '../../address/AddressRead/read_addres.dart';

class Body extends StatelessWidget {
  final User? user;
  final List<User> users;
  final Address? address;
  const Body(
      {Key? key,
      required this.user,
      required this.users,
      required this.address})
      : super(key: key);
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
            Image.asset(
              "assets/imgs/img_main.png",
              height: size.height * 0.45,
            ),
            Text(
              "GREEN WASTE",
              style: Theme.of(context).textTheme.headline3,
            ),
            RoundedButton(
              text: "Datos personales",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateUser(user: user!)),
                );
              },
            ),
            RoundedButton(
              text: "Direcciones",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReadAddress(
                            user: user!,
                            users: const [],
                            address: address,
                          )),
                );
              },
            ),
            RoundedButton(
              text: "Historial de recompensas",
              press: () {},
            ),
            RoundedButton(
              text: "Cerrar sesión",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
