import 'package:flutter/material.dart';
import 'package:movil_app/components/rounded_input_field.dart';
import 'package:movil_app/screens/addContainer/components/background.dart';

import '../../../service/common/user.dart';

class Body extends StatefulWidget {
  final User? user;

  const Body(
      {Key? key,
        required this.user})
      : super(key: key);

  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<Body> {

  List _cities =
  ["Cluj-Napoca", "Bucuresti", "Timisoara", "Brasov", "Constanta"];

  late List<DropdownMenuItem<String>> _dropDownMenuItems;
  late String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>>items= [];
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text(
            "Agregar contenedor",
            style: Theme.of(context).textTheme.headline2,
          ),
          Image.asset(
            "assets/imgs/img_agregarContenedor_movil.png",
            height: size.height * 0.45,
          ),

          ],
      ),

    ),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }

}