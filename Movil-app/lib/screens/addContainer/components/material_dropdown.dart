import 'package:flutter/material.dart';

import '../../../constants.dart';

class MaterialDropDown extends StatefulWidget {
  const MaterialDropDown({Key? key}) : super(key: key);

  @override
  State<MaterialDropDown> createState() => _MaterialDropDown();
}

class _MaterialDropDown extends State<MaterialDropDown> {
  String dropdownValue = 'Material';

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
      items: <String>['Material','Aluminio', 'Pet','Cartón']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}