import 'package:flutter/material.dart';

import 'package:movil_app/service/common/user.dart';
import 'components/body_containers.dart';

class ContainersScreen extends StatelessWidget{
  final User? user;

  const ContainersScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: BodyContainers(
        user: user,
      ),
    );
  }
}