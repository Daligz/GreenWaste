import 'package:flutter/material.dart';

class RewardContainer extends StatelessWidget {

  const RewardContainer({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Column(
          children: <Widget> [
            Text('a'),
            Text('a'),
            Text('a'),
            Text('a')
          ],
        ),
        SizedBox(width: size.width * 0.2),
        Column(
          children: <Widget> [
            Text('XDD'),
            Text('XDD'),
            Text('XDD'),
            Text('XDD')
          ],
        )
      ],
    );
  }
}