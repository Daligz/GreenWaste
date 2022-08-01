import 'package:flutter/material.dart';
import 'package:movil_app/constants.dart';
import 'package:movil_app/service/common/reward.dart';

class RewardCard extends StatelessWidget {
  final Reward? model;
  const RewardCard({Key? key, this.model}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: _cardDecoration(),
      width: size.width * 0.025,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Image.network(
                model!.imagen?? "",
                height: size.height * 0.2,
                width: size.width * 0.4
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.025),
                  child: Text(model!.nombre??""),
                )
              ],
            ),
            SizedBox(height: size.height * 0.005),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Column(
                    children: <Widget> [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.height * 0.025),
                        child: Text(
                          model!.valor.toString() + " puntos",
                          style: TextStyle(
                              color: Colors.black87
                          ),
                        ),
                      ),
                    ]
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.height * 0.025),
                      child: GestureDetector(
                        child: const Icon(Icons.shopping_cart, color: kPrimaryColor,),
                        onTap: (){
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ]
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.0),
        boxShadow: const <BoxShadow> [
          BoxShadow(
              color: kPrimaryColor,
              offset: Offset(0.5, 0.5),
              blurRadius: 0.9
          )
        ]
    );
  }
}