import 'package:flutter/material.dart';
import 'package:movil_app/constants.dart';
import 'package:movil_app/service/common/reward.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:movil_app/service/service_claims.dart';
import 'package:movil_app/service/service_points.dart';

class RewardCard extends StatelessWidget {
  final User? user;
  final Reward? model;
  const RewardCard({Key? key, this.model, required this.user}) : super(key: key);

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
                          _showAlertDialog(context);
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

  void _showAlertDialog(context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text("Confirmación"),
            content: Text("¿Desea canjear este premio?"),
            actions: <Widget>[
              RaisedButton(
                child: Text("Cerrar", style: TextStyle(color: Colors.red),),
                onPressed: (){ Navigator.of(context).pop(); },
              ),
              RaisedButton(
                child: Text("Aceptar", style: TextStyle(color: kPrimaryColor),),
                onPressed: () async {
                  String points = await ServicePoints.updatePoints(user!.idUsuario, model!.valor, model!.idPremio);
                  if(points == "true"){
                    bool claim = await ServiceClaims.createClaim(user!.correo, model!.idPremio);
                    if(claim){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Canjee exitoso")));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Error al realizar el canjee")));
                    }
                  }else{
                    if(points == "false"){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Puntos insuficientes")));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Sin stock")));
                    }

                  }


                  Navigator.of(context).pop(); },
              ),
            ],
          );
        }
    );
  }

}
