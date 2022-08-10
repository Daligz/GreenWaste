import 'package:flutter/material.dart';
import 'package:movil_app/service/common/user.dart';


import 'components/address_body.dart';

class AddressReadScreen extends StatelessWidget {
  final User? user;
  AddressReadScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
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
                        "Usuario: " + user!.nombre + user!.apellidoPaterno,
                        style: TextStyle(fontSize: 14),
                      )),
                  Container(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        "Puntos: 48 puntos",
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
        body: AddressBody(user: user),

      ),
    );
  }

}