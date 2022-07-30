import 'package:flutter/material.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import '../../../../components/rounded_button.dart';
import '../../../../service/common/user.dart';
import 'container_readAddress.dart';
import 'package:movil_app/screens/address/AddressCreate/create_address.dart';


class BodyReadAddress extends StatelessWidget {

  final User? user;
  const BodyReadAddress({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(final BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            ContainerReadAddress(user: user!),

          ],
        ),
      ),
    );
  }
}