import 'package:flutter/material.dart';
import 'package:movil_app/screens/rewards/components/reward_card.dart';

class RewardContainer extends StatelessWidget {

  const RewardContainer({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        RewardCard(),
        SizedBox(width: size.width * 0.2),
        RewardCard()
      ],
    );
  }
}