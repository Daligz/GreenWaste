import 'package:flutter/material.dart';
import 'package:movil_app/screens/rewards/components/reward_card.dart';

class RewardContainer extends StatelessWidget {

  const RewardContainer({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget> [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              'Recompensas',
              style: _titleStyle(size)
            )
          ],
        ),
        SizedBox(height: size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            RewardCard(),
            SizedBox(width: size.width * 0.1),
            RewardCard()
          ],
        ),
        SizedBox(height: size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            RewardCard(),
            SizedBox(width: size.width * 0.05),
            RewardCard()
          ],
        )
      ],
    );
  }

  TextStyle _titleStyle(final Size size) {
    return TextStyle(
      fontSize: size.height * 0.04,
      color: const Color(0xFF358F80),
      fontWeight: FontWeight.bold
    );
  }
}