import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/screens/addContainer/components/background.dart';
import 'package:movil_app/components/already_have_a_container_check.dart';
import '../../../constants.dart';
import '../../../service/common/user.dart';
import 'dropdowns.dart';
import 'package:movil_app/screens/Containers/containers.dart';

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
            Dropdowns(user: user),
            SizedBox(height: size.height * 0.02),
            //AddressDropDown(user: user),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAContainerCheck(
              newContainer: false,
              press: () {
                Navigator.of(context).pushNamed(
                  '/main-screen',
                  arguments: {
                    'user': user,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
