import 'package:flutter/material.dart';
import 'package:movil_app/screens/addContainer/add_container_screen.dart';
import 'package:movil_app/service/common/containers.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:movil_app/service/service.dart';
import 'package:movil_app/components/already_have_a_container_check.dart';
import 'card.dart';
class conContainers extends StatelessWidget {
  final User? user;
  const conContainers({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text("Contenedores",
                  //user!.nombre,
                  style: _titleStyle(size)
              )
            ],
          ),
          SizedBox(height: size.height * 0.1),

          loadContainers(),
          SizedBox(height: size.height * 0.02),
          SizedBox(height: 25),

          AlreadyHaveAContainerCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContainerScreen(user: user)),
              );
            },
          ),
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

  Widget loadContainers() {

    return FutureBuilder(

        future: Service.readContainers(1),
        builder: (
            BuildContext context,
            AsyncSnapshot<List<Containers>?> c,
            ) {
          if(c.hasData){
            print(c.data);
            return listContainers(c.data);
          }
          return const Center(child: CircularProgressIndicator(),);
        }
    );
  }

  Widget listContainers(containers){
    return  ListView.builder(
        //scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: containers.length,
        itemBuilder: (context, index) => ContainersCard(
          containers: containers[index],
          user: user,
        )
    );
  }


}