import 'package:flutter/material.dart';

import '../../service/common/user.dart';
import 'components/body.dart';

class AddContainerScreen extends StatelessWidget{
  final User? user;

  const AddContainerScreen(
      {Key? key,
        required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        user: user,
      ),
    );
  }
}