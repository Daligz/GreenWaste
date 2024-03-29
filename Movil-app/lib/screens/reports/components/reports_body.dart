import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:movil_app/service/common/claim.dart';
import 'package:movil_app/service/service_claims.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class ReportBody extends StatefulWidget {

  final String? idUsuario;

  const ReportBody(this.idUsuario);

  @override
  _ReportBodyState createState() => _ReportBodyState(idUsuario);
}

class _ReportBodyState extends State<ReportBody> {

  Claim claim = Claim(0, List.empty());
  bool loading = true;
  final String? idUsuario;
  final _controller = ScrollController();
  final ScreenshotController _screenshotController = ScreenshotController();

  _ReportBodyState(this.idUsuario);

  @override
  Widget build(final BuildContext context) {
    _loadData();
    return Screenshot(
      controller: _screenshotController,
      child: _local()
    );
  }

  void _loadData() async {
    final Claim claimData = await ServiceClaims.getClaim(idUsuario!);
    setState(() {
      claim = claimData;
      loading = false;
    });
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
                children: <Widget> [
                  Text(
                      '${claim.usedPoints.toString()} puntos',
                      style: pointsStyle
                  ),
                  const Text(
                      'Utilizados',
                      style: pointsText
                  ),
                  const Text(
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
            _itemList(),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _shareReport(),
        tooltip: 'Compartir',
        backgroundColor: const Color(0xFF358F80),
        foregroundColor: const Color(0xFFF4F0F0),
        child: const Icon(Icons.share)
      )
    );
  }

  void _shareReport() async {
    await _screenshotController.capture(delay: const Duration(milliseconds: 10)).then((Uint8List? image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image-${DateTime.now().microsecond}.png').create();
        await imagePath.writeAsBytes(image);

        await Share.shareFiles([imagePath.path]);
      }
    });
  }

  Widget _itemList() {
    const TextStyle pointsText = TextStyle(
        fontSize: 15.0,
        color: Color(0xFF000000)
    );
    return (!loading) ? ListView.builder(
      controller: _controller,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: claim.rewardData.length,
      itemBuilder: (context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget> [
          Text(
              claim.rewardData[index].nombre,
              style: pointsText
          ),
          const SizedBox(width: 50.0),
          Text(
              '${claim.rewardData[index].valor.toString()} pts',
              style: pointsText
          ),
          const SizedBox(height: 55.0)
        ]
      )
    ) : const LinearProgressIndicator();
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}