import 'package:flutter/material.dart';
import 'package:movil_app/components/text_field_container.dart';
import 'package:movil_app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Contraseña",
          icon: Icon(
            Icons.lock,
            color: kPrimaryDarkColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}