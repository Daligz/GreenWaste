import 'package:flutter/material.dart';
import 'package:movil_app/screens/Profile/components/background.dart';

class ReportBody extends StatelessWidget {

  const ReportBody({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _local();
  }

  Widget _local() {
    const TextStyle titleStyle = TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF358F80),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget> [
          const SizedBox(height: 50.0),
          Text(
            'Historial de Recompensas',
            style: titleStyle,
          ),
          Text(
              'SEPTIEMBRE'
          ),
          Text(
              '306 puntos'
          ),
          Text(
              'Utilizados'
          ),
          Text(
              'durante este mes'
          ),
          Text(
              'Lista de recompensas obtenidas durante este mes'
          ),
          Text(
              'Linterna'
          ),
          Text(
              '89 pts'
          ),
        ],
      )
    );
  }
}