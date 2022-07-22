import 'package:flutter/material.dart';
import 'package:movil_app/screens/rewards/components/reward_body.dart';

class ReportScreen extends StatelessWidget {

  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(
      body: RewardBody(),
    );
  }
}