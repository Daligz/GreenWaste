import 'package:flutter/material.dart';

import 'package:movil_app/service/common/user.dart';
import 'components/body_containers.dart';

class ContainersScreen extends StatelessWidget{
  final User? user;

  const ContainersScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF358F80),
        title: Row(
          children: [
            Image.asset(
              "assets/imgs/img_editar_usuario_movil.png",
              fit: BoxFit.contain,
              height: 32,
            ),
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      "Usuario: " + user!.nombre,
                      style: TextStyle(fontSize: 14),
                    )),
              ],
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "GREEN WASTE",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
      body: BodyContainers(
        user: user,
      ),

    );
  }
}