import 'package:flutter/material.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/service/common/user.dart';

import 'address_container.dart';

class AddressBody extends StatelessWidget {
  final User? user;
  const AddressBody({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            AddressContainer(user: user,),
          ],
        ),
      ),
    );
  }
}