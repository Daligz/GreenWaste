import 'package:flutter/material.dart';
import 'package:movil_app/constants.dart';
import 'package:movil_app/screens/Profile/profile_screen.dart';
import 'package:movil_app/screens/main_screen.dart';
import 'package:movil_app/service/common/containers.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movil_app/service/service.dart';
import 'package:movil_app/screens/Containers/containers.dart';


class ContainersCard extends StatelessWidget {
  final User? user;
  final Containers? containers;
  final Color color;

  const ContainersCard({Key? key, required this.user,this.color = kPrimaryColor, this.containers}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    String lleno = "lleno";
    String vacio = "vacio";
    final Size size = MediaQuery.of(context).size;
    return Container(

      child: Column(

        children: <Widget>[

          SizedBox(

            width: 250,
            height: 350,
            child: Card(
              elevation: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Column(

                  children: [

                    SizedBox(height: size.height * 0.05),
                    Image.asset(
                      "assets/imgs/img_agregarContenedor_movil.png",
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(containers!.nombre,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: FlatButton(
                        onPressed: () async {
                          //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(containers!.idContenedor.toString()),));

                          if(containers!.estado == "vacio"){
                            bool valor = await Service.updateContainers(containers!.idContenedor, lleno);


                            if(valor != false){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Éxito!"),));
                              Navigator.of(context).pushNamed('/main-screen', arguments: {'user': user,},);
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen(user: user)));

                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Error al editar el contenedor!"),));
                            }
                          }else if(containers!.estado == "lleno"){
                            bool valor = await Service.updateContainers(containers!.idContenedor, vacio);

                            if(valor != false){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Éxito!"),));
                              Navigator.of(context).pushNamed('/main-screen', arguments: {'user': user,},);
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen(user: user)));
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Error al editar el contendor!"),));
                            }
                          }
                         /*
                          Fluttertoast.showToast(
                              msg: "Contenedor: "+containers!.idContenedor.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          */

                        },

                        child: Text(containers!.estado, style: TextStyle(color: Colors.white)),
                        color: color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}