import 'package:flutter/material.dart';
import 'package:movil_app/screens/UpdateUser/components/body.dart';
import 'package:movil_app/service/common/user.dart';

class UpdateUser extends StatelessWidget{
  final User? user;
  UpdateUser({Key? key, required this.user }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        user: user,
      ),);
  }
}