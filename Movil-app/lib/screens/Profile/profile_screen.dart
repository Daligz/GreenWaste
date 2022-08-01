import 'package:flutter/material.dart';
import 'package:movil_app/service/common/address.dart';
import 'package:movil_app/service/common/user.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  final User? user;
  final List<User> users;
  final Address? address;
  const ProfileScreen(
      {Key? key,
      required this.user,
      required this.users,
      required this.address})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        user: user,
        users: const [],
        address: address,
      ),
    );
  }
}
