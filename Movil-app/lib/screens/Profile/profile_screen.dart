import 'package:flutter/material.dart';
import 'package:movil_app/service/common/user.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget{
  final User? user;
  ProfileScreen({Key? key, required this.user }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
          user: user
      ),);
  }
}