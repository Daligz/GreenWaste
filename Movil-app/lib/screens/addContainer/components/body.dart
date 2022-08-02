import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/screens/addContainer/components/background.dart';

class Body extends StatelessWidget {
  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController materialTextController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Agregar contenedor",
              style: Theme.of(context).textTheme.headline2,
            ),
            Image.asset(
              "assets/imgs/img_agregarContenedor_movil.png",
              height: size.height * 0.45,
            ),
            RoundedInputField(
                hintText: "Material",
                icon: Icons.delete,
                onChanged: (value) {},
                controller: materialTextController
            ),
            /*DropdownButtonFormField(

                  ),*/
            /*DropdownButtonFormField(

                  ),*/
          ],
        ),
      ),
    );
  }
}