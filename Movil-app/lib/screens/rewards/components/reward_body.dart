import 'package:flutter/material.dart';
import 'package:movil_app/screens/Profile/components/background.dart';
import 'package:movil_app/screens/rewards/components/reward_container.dart';
import 'package:movil_app/service/common/user.dart';

class RewardBody extends StatelessWidget {
  final User? user;
  const RewardBody({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            RewardContainer(user: user,)
          ],
        ),
      ),
    );
  }
}