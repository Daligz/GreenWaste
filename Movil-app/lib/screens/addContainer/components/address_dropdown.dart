import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../service/common/user.dart';
import '../../../service/common/address.dart';
import 'package:movil_app/service/service.dart';

class AddressDropDown extends StatefulWidget {
  final User? user;

  const AddressDropDown({Key? key, required this.user}) : super(key: key);

  @override
  State<AddressDropDown> createState() => _AddressDropDown();
}

class _AddressDropDown extends State<AddressDropDown> {
  String? dropdownValue;
  int? usuario;
  List<Address>? addresses;

  getAdresses() async{
    List<Address>? a = await Service.readAddress(usuario!);
    setState((){
      addresses = a;
      dropdownValue = a![0].idDireccion.toString();
    });
  }

  @override
  void initState(){
    super.initState();
    usuario = widget.user!.idUsuario;
    getAdresses();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryLightColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryLightColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: kPrimaryLightColor,
      ),
      dropdownColor: kPrimaryLightColor,

      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: kTextColor),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    items: addresses?.map((item) {
    return DropdownMenuItem(
    child: Text(item.calle),
    value: item.idDireccion.toString(),
    );
  })?.toList()
    );
  }
}

