import 'package:flutter/material.dart';
import 'package:movil_app/screens/reports/components/reports_body.dart';

import '../../service/common/claim.dart';

class ReportScreen extends StatelessWidget {

  @override
  Widget build(final BuildContext context) {
    List<RewardData> rewards = [
      RewardData('nombre', 'descripcion', 'imagen', 50, 5),
      RewardData('nombre2', 'descripcion', 'imagen', 25, 5)
    ];
    return Scaffold(
      body: ReportBody(Claim(75, rewards)),
    );
  }
}