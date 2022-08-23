import 'package:flutter/material.dart';
import './components/body_address.dart';
import 'package:movil_app/service/common/user.dart';

class AddressCreate extends StatelessWidget{
  final User? user;
  AddressCreate({Key? key, required this.user }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body_Address(user: user),);
  }
}