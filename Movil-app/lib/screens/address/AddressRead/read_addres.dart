// ignore_for_file: no_logic_in_create_state, unnecessary_this, prefer_interpolation_to_compose_strings, prefer_const_constructors, deprecated_member_use, avoid_print, prefer_final_fields, unnecessary_import, unused_import

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movil_app/screens/UpdateUser/update_user.dart';
import 'package:movil_app/service/common/address.dart';
import 'package:movil_app/service/service.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:flutter/services.dart';

import '../AddressUpdate/update_address.dart';

class ReadAddress extends StatefulWidget {
  final User? user;
  final List<User> users;
  final Address? address;
  const ReadAddress(
      {Key? key,
      required this.user,
      required this.users,
      required this.address})
      : super(key: key);

  @override
  State<ReadAddress> createState() => _ReadAddressState(user, users, address);
}

class _ReadAddressState extends State<ReadAddress> {
  //List<Address> _address;
  //_AddressScreenState(this._address);
  final User? user;
  final Address? address;
  final List<User> users;
  _ReadAddressState(this.user, this.users, this.address);
  List<Persona> _personas = [
    Persona("Axel", "Martinez Sanjuan", "7721141966"),
    Persona("Edgar", "Martinez Sanjuan", "7721141966"),
    Persona("Marco Antonio", "Martinez Sanjuan", "7721141966"),
    Persona("Jose de Jesus", "Martinez Sanjuan", "7721141966"),
    Persona("Guillermo", "Martinez Sanjuan", "7721141966"),
    Persona("Jezer", "Martinez Sanjuan", "7721141966"),
    Persona("1", "Martinez Sanjuan", "7721141966"),
    Persona("Jose", "Martinez Sanjuan", "7721141966"),
    Persona("memo", "Martinez Sanjuan", "7721141966"),
    Persona("sedasd", "Martinez Sanjuan", "7721141966"),
    Persona("Madsa", "Martinez Sanjuan", "7721141966"),
    Persona("Jfdgfdg", "Martinez Sanjuan", "7721141966"),
    Persona("Gdfgdfg", "Martinez Sanjuan", "7721141966"),
    Persona("Jghgh", "Martinez Sanjuan", "7721141966"),
    Persona("Marcofso", "Martinez Sanjuan", "7721141966"),
    Persona("Joxcvb", "Martinez Sanjuan", "7721141966"),
    Persona("Gerdiop", "Martinez Sanjuan", "7721141966"),
    Persona("J9oger", "Martinez Sanjuan", "7721141966"),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
        body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                this._borarrPersona(context, _personas[index]);
              },
              title:
                  Text(_personas[index].name + '' + _personas[index].lastname),
              subtitle: Text(_personas[index].phone),
              leading: Icon(Icons.person_pin_circle,
                  color: const Color(0xFF358F80), size: size.height * 0.08),
              trailing: Column(
                children: [
                  IconButton(
                      icon: const Icon(Icons.drive_file_rename_outline,
                          color: const Color(0xFF358F80)),
                      tooltip: 'Editar Dirección',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddressUpdate(
                                    user: user!,
                                    address: address!,
                                  )),
                        );
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _borarrPersona(contex, Persona persona) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Contacto"),
              content:
                  Text("Esta seguro de querer aliminar a" + persona.name + '?'),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancelar"),
                ),
                FlatButton(
                  onPressed: () {
                    print(persona.name);
                    this.setState(() {
                      this._personas.remove(persona);
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Borrar",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ));
  }
}

class Persona {
  String name;
  String lastname;
  String phone;

  Persona(this.name, this.lastname, this.phone);
}
