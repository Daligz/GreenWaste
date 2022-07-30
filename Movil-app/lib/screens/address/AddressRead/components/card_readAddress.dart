import 'package:flutter/material.dart';

class CardReadAddress extends StatelessWidget {

  const CardReadAddress({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: _cardDecoration(),
      width: size.width * 0.90,
      height: size.height * 0.13,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.height * 0.01),
                    child: Icon(
                        Icons.pin_drop,
                        color: const Color(0xFF358F80),
                        size: size.height * 0.06
                    )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.010),
                  child: const Text('Fraccionamiento el Paraiso'),
                ),
                IconButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.077),
                  icon: Icon(
                    Icons.edit_note_sharp,
                      color: const Color(0xFF358F80),
                      size: size.height * 0.08),
                  onPressed: () {
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.09),
                  child: const Text('El Loro, SN, Hidalgo'),
                ),
              ],
            ),
          ]
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const <BoxShadow> [
          BoxShadow(
              color: Color(0xFF358F80),
              offset: Offset(6.0, 6.0),
              blurRadius: 0.9
          )
        ]
    );
  }
}