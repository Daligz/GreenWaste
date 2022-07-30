import 'package:flutter/material.dart';
import 'package:movil_app/screens/address/AddressRead/components/card_readAddress.dart';

class ContainerReadAddress extends StatelessWidget {

  const ContainerReadAddress({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget> [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
                'Recompensas',
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