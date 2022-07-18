import 'package:flutter/material.dart';
import 'package:movil_app/screens/Profile/components/background.dart';

class RewardBody extends StatelessWidget {

  const RewardBody({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget> [

          ],
        ),
      ),
    );
  }
}