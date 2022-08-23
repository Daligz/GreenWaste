import 'package:flutter/material.dart';
import 'package:movil_app/service/common/user.dart';
import 'background_containers.dart';
import 'con_containers.dart';

class BodyContainers extends StatelessWidget {
  final User? user;
  const BodyContainers({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            conContainers(
                user: user,
            ),
          ],
        ),
      ),
    );
  }
}