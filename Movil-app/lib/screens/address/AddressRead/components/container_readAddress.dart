import 'package:flutter/material.dart';
import 'package:movil_app/screens/address/AddressCreate/create_address.dart';
import 'package:movil_app/screens/address/AddressRead/components/card_readAddress.dart';

import '../../../../components/rounded_button.dart';
import '../../../../service/common/user.dart';

class ContainerReadAddress extends StatelessWidget {
  final User? user;
  const ContainerReadAddress({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget> [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
                'Mis Direcciones',
                style: _titleStyle(size)
            )
          ],
        ),
        SizedBox(height: size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            CardReadAddress(),
          ],
        ),
        RoundedButton(
          text: "Agregar nueva dirección",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddressCreate(user: user!)),
            );
          },
        ),
      ],
    );
  }

  TextStyle _titleStyle(final Size size) {
    return TextStyle(
        fontSize: size.height * 0.04,
        color: const Color(0xFF358F80),
        fontWeight: FontWeight.bold
    );
  }
}