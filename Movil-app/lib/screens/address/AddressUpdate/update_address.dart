import 'package:flutter/material.dart';
import 'package:movil_app/service/common/address.dart';
import 'package:movil_app/service/common/user.dart';

import 'components/body_updateAddress.dart';

class AddressUpdate extends StatelessWidget {
  final Address? address;
  final User? user;
  AddressUpdate({Key? key, required this.address, required this.user})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyUpdateAddress(
        address: address,
        user: user,
      ),
    );
  }
}
