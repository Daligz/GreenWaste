import 'package:flutter/material.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import '../../../../service/common/user.dart';
import 'container_readAddress.dart';

class BodyReadAddress extends StatelessWidget {

  final User? user;
  const BodyReadAddress({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(final BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget> [

            ContainerReadAddress()
          ],
        ),
      ),
    );
  }
}