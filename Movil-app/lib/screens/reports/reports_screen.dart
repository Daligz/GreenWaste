import 'package:flutter/material.dart';
import 'package:movil_app/screens/reports/components/reports_body.dart';

class ReportScreen extends StatelessWidget {

  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(
      body: ReportBody(),
    );
  }
}