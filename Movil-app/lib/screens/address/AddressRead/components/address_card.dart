import 'package:flutter/material.dart';
import 'package:movil_app/constants.dart';
import 'package:movil_app/service/common/address.dart';
import 'package:movil_app/service/common/reward.dart';
import 'package:movil_app/service/common/user.dart';

import '../../AddressUpdate/update_address.dart';

class AddressCard extends StatelessWidget {
  final User? user;
  final Address? address;
  const AddressCard({Key? key, this.address, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListTile(
      title:
      Text(address!.colonia??""),
      subtitle: Text(address!.calle +', '+ address!.numero +', '+ address!.municipio +', ' + address!.estado??""),
      leading: Icon(Icons.person_pin_circle,
          color: const Color(0xFF358F80), size: size.height * 0.06),
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
                        address: address,
                      )),
                );
              }),
        ],
      ),
    );

    Container(
      decoration: _cardDecoration(),
      width: size.width * 0.02,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            SizedBox(height: size.height * 0.0001),
            Row(
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.025),
                  child: Icon(Icons.person_pin_circle,
                      color: const Color(0xFF358F80), size: size.height * 0.06),
                ),

              ],
            ),
            Row(
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.1),
                  child:Text(address!.colonia??""),

                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Column(
                    children: <Widget> [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.height * 0.025),
                        child: Text(
                          address!.estado??"",
                          style: TextStyle(
                              color: Colors.black87
                          ),
                        ),
                      ),
                    ]
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.height * 0.025),
                      child: GestureDetector(
                        child:  IconButton(
                            icon: const Icon(Icons.drive_file_rename_outline,
                                color: const Color(0xFF358F80)),
                            tooltip: 'Editar Dirección',
                            onPressed: () {

                            }),
                      ),
                    )
                  ],
                )
              ],
            ),
          ]
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.0),
        boxShadow: const <BoxShadow> [
          BoxShadow(
              color: kPrimaryColor,
              offset: Offset(0.5, 0.5),
              blurRadius: 0.9
          )
        ]
    );
  }
}
