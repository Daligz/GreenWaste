import 'package:flutter/material.dart';
import 'package:movil_app/screens/reports/components/reports_body.dart';

class ReportScreen extends StatelessWidget {

  final String idUsuario;

  const ReportScreen(this.idUsuario);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: ReportBody(idUsuario),
    );
  }
}