import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_button.dart';
import 'package:movil_app/service/common/address.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:movil_app/service/service.dart';
import 'package:movil_app/service/service_container.dart';

import '../../../constants.dart';
import '../../../service/common/materials.dart';
import '../../../service/service_materials.dart';

class Dropdowns extends StatefulWidget {
  final User? user;
  Dropdowns({Key? key, required this.user}) : super(key: key);

  @override
  State<Dropdowns> createState() => _Dropdowns();

}

class _Dropdowns extends State<Dropdowns> {
  String? dropdownValueMaterial;
  String dropdownValueState = 'Vacío';

  List<Materials>? materiales;

  //Address
  String? dropdownValueAddress;
  User? user;
  int? usuario;
  List<Address>? addresses;

  getMaterials() async{
    List<Materials>? m = await ServiceMaterials.getMaterials();
    setState((){
      materiales = m;
      print(m);
      dropdownValueMaterial = m![0].idMaterial.toString();
      print(dropdownValueMaterial);
    });
  }

  getAdresses() async{
    List<Address>? a = await Service.readAddress(usuario!);
    setState((){
      addresses = a;
      dropdownValueAddress = a![0].idDireccion.toString();
    });
  }

  @override
  void initState(){
    super.initState();
    usuario = widget.user!.idUsuario;
    user = widget.user!;
    getMaterials();
    getAdresses();
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
      DropdownButtonFormField<String>(
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

    value: dropdownValueMaterial,
    icon: const Icon(Icons.arrow_downward),
    elevation: 16,
    style: const TextStyle(color: kTextColor),
    hint: Text('Seleciona un material'),
    onChanged: (String? newValue) {
    setState(() {
    dropdownValueMaterial = newValue!;
    });
    },
    items: materiales?.map((item) {
    return DropdownMenuItem(
    child: Text(item.nombre),
    value: item.idMaterial.toString(),
    );
    })?.toList()
    ),
          SizedBox(height: size.height * 0.02),
          DropdownButtonFormField<String>(
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

              value: dropdownValueAddress,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: kTextColor),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValueAddress = newValue!;
                });
              },
              items: addresses?.map((item) {
                return DropdownMenuItem(
                  child: Text(item.calle),
                  value: item.idDireccion.toString(),
                );
              })?.toList()
          ),
          SizedBox(height: size.height * 0.02),
          RoundedButton(
            text: "Agregar",
            press: () async{
              print(dropdownValueMaterial);
              print(dropdownValueAddress);
              bool success = await ServiceContainer.createContainer(int.parse(dropdownValueMaterial!), int.parse(dropdownValueAddress!), 'vacio');
              if(success){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Éxito, se agregó el contenedor!"),));
                Navigator.of(context).pushNamed(
                  '/main-screen',
                  arguments: {
                    'user': user,
                  },
                );

              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Error, no se agregó el contenedor!"),));
              }
              },
          ),
        ],
      ),
    );
  }
}