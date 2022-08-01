import 'package:flutter/material.dart';
import 'package:movil_app/screens/rewards/components/reward_card.dart';
import 'package:movil_app/service/common/reward.dart';
import 'package:movil_app/service/service_rewards.dart';

class RewardContainer extends StatelessWidget {

  const RewardContainer({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        SizedBox(height: size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
                'Recompensas',
                style: _titleStyle(size)
            )
          ],
        ),
        SizedBox(height: size.height * 0.02),
        loadRewards(),
        SizedBox(height: size.height * 0.02),
      ],
    ),
    );
  }

  TextStyle _titleStyle(final Size size) {
    return TextStyle(
      fontSize: size.height * 0.04,
      color: const Color(0xFF358F80),
      fontWeight: FontWeight.bold
    );
  }

  Widget loadRewards() {
    //List<Reward> rewards = await ServiceRewards.getRewards();
    return FutureBuilder(
      future: ServiceRewards.getRewards(),
      builder: (
        BuildContext context,
          AsyncSnapshot<List<Reward>?> model,
      ) {
        //print(model.data);
        if(model.hasData){
          print(model.data);
          return listRewards(model.data);
        }
        return const Center(child: CircularProgressIndicator(),);
      }
    );
  }

  Widget listRewards(rewards){
    return  GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: rewards.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.75,
      ), itemBuilder: (context, index) => RewardCard(
        model: rewards[index],
      )
      );
  }

}