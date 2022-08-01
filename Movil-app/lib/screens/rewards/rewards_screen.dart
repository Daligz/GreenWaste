import 'package:flutter/material.dart';
import 'package:movil_app/screens/rewards/components/reward_body.dart';
import 'package:movil_app/screens/rewards/components/reward_card.dart';
import 'package:movil_app/service/common/reward.dart';
import 'package:movil_app/service/service_rewards.dart';

class RewardScreen extends StatelessWidget {

  const RewardScreen({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(
      body: RewardBody(),
    );
  }

}