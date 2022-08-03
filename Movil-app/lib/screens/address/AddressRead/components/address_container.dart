import 'package:flutter/material.dart';
import 'package:movil_app/service/common/address.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:movil_app/service/service.dart';

import 'address_card.dart';

class AddressContainer extends StatelessWidget {
  final User? user;
  const AddressContainer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        SizedBox(height: size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
                'Mis Direcciones',
                style: _titleStyle(size)
            )
          ],
        ),
        SizedBox(height: size.height * 0.1),
        loadAddress(),
        SizedBox(height: size.height * 0.1),
      ],
    ),
    );
  }

  TextStyle _titleStyle(final Size size) {
    return TextStyle(
      fontSize: size.height * 0.04,
      color: const Color(0xFF358F80),
      fontWeight: FontWeight.bold
    );
  }

  Widget loadAddress() {
    return FutureBuilder(
      future: Service.readAddress(user!.idUsuario),
      builder: (
        BuildContext context,
          AsyncSnapshot<List<Address>?> model,
      ) {
        if(model.hasData){
          print(model.data);
          return listAddress(model.data);
        }
        return const Center(child: CircularProgressIndicator(),);
      }
    );
  }

  Widget listAddress(address){
    return  ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: address.length,
        itemBuilder: (context, index) => AddressCard(
        address: address[index],
        user: user,
      )
      );
  }

}