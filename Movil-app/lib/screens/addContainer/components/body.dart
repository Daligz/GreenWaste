import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/screens/addContainer/components/address_dropdown.dart';
import 'package:movil_app/screens/addContainer/components/background.dart';
import 'package:movil_app/screens/addContainer/components/state_dropdown.dart';

import '../../../constants.dart';
import '../../../service/common/user.dart';
import 'material_dropdown.dart';

class Body extends StatelessWidget {
  final User? user;
  const Body({
    Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Text(
              "Agregar contenedor",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: size.height * 0.02),
            Image.asset(
              "assets/imgs/img_agregarContenedor_movil.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.02),
            MaterialDropDown(),
            SizedBox(height: size.height * 0.02),
            StateDropDown(),
            SizedBox(height: size.height * 0.02),
            AddressDropDown(user: user),
          ],
        ),
      ),
    );
  }
}
