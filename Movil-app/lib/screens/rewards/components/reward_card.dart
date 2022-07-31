import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: _cardDecoration(),
      width: size.width * 0.35,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Image.network(
            'https://m.media-amazon.com/images/I/61UGE9cZVlL._AC_SL1500_.jpg',
            height: size.height * 0.1,
            width: size.width * 0.3),
        SizedBox(height: size.height * 0.05),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.025),
              child: const Text('Laptop'),
            )
          ],
        ),
        SizedBox(height: size.height * 0.005),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.025),
              child: const Text(
                '90 puntos',
                style: TextStyle(color: Colors.black87),
              ),
            )
          ],
        ),
        SizedBox(height: size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.height * 0.01),
                child: Icon(Icons.shopping_cart,
                    color: const Color(0xFF358F80), size: size.height * 0.06))
          ],
        )
      ]),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color(0xFF358F80),
              offset: Offset(6.0, 6.0),
              blurRadius: 0.9)
        ]);
  }
}
