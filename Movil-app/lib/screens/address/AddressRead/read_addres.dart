import 'package:flutter/material.dart';
import 'components/body_readAddress.dart';
import 'package:movil_app/service/common/user.dart';


class AddressScreen extends StatelessWidget{
  final User? user;
  AddressScreen({Key? key, required this.user }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyReadAddress(
          user: user
      ),);
  }
}