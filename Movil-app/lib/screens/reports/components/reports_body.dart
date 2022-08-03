import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
      fontWeight: FontWeight.w800,
      color: Color(0xFF358F80)
    );
    const TextStyle subtitleStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Color(0xFF358F80)
    );
    const TextStyle pointsStyle = TextStyle(
      fontSize: 20.0,
      /**shadows: [
        BoxShadow(
          offset: Offset.zero,
          blurRadius: 50.0
        )
      ],*/
      color: Color(0x7D000000)
    );
    const TextStyle pointsText = TextStyle(
      fontSize: 15.0,
      color: Color(0xFF000000)
    );
    initializeDateFormatting();
    Intl.defaultLocale = 'es';
    String monthName = DateFormat('MMMM').format(DateTime(0, DateTime.now().month)).toCapitalized();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            const SizedBox(height: 50.0),
            const Text(
                'Historial de Recompensas',
                style: titleStyle
            ),
            Text(
                monthName,
                style: subtitleStyle
            ),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 95.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget> [
                  Text(
                      '306 puntos',
                      style: pointsStyle
                  ),
                  Text(
                      'Utilizados',
                      style: pointsText
                  ),
                  Text(
                      'durante este mes',
                      style: pointsText
                  )
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            const Text(
                'Lista de recompensas obtenidas durante este mes',
                style: pointsText
            ),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget> [
                Text(
                    'Linterna'
                ),
                SizedBox(width: 50.0),
                Text(
                    '89 pts'
                )
              ],
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Compartir',
        backgroundColor: const Color(0xFF358F80),
        foregroundColor: const Color(0xFFF4F0F0),
        child: const Icon(Icons.share)
      )
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}