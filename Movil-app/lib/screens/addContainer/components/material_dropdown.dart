import 'package:flutter/material.dart';
import 'package:movil_app/service/common/materials.dart';
import 'package:movil_app/service/service_materials.dart';

import '../../../constants.dart';

class MaterialDropDown extends StatefulWidget {
  const MaterialDropDown({Key? key}) : super(key: key);

  @override
  State<MaterialDropDown> createState() => _MaterialDropDown();
}

class _MaterialDropDown extends State<MaterialDropDown> {
  String? dropdownValue;

  List<Materials>? materiales;


   getMaterials() async{
    List<Materials>? m = await ServiceMaterials.getMaterials();
    setState((){
      materiales = m;
      dropdownValue = m![0].idMaterial.toString();
    });
  }

  @override
  void initState(){
     super.initState();
     getMaterials();
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
      hint: Text('Seleciona un material'),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: materiales?.map((item) {
        return DropdownMenuItem(
        child: Text(item.nombre),
        value: item.idMaterial.toString(),
    );
    })?.toList()

    );
  }


}