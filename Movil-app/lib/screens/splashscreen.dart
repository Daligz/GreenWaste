import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/imgs/img_main.png'),
            Column(
              children: <Widget>[
                Text(
                  'Green Waste',
                  style: Theme.of(context).textTheme.headline1,
                ),
                /*Text(
                  'made easy',
                  style: Theme.of(context).textTheme.headline2 ,
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}