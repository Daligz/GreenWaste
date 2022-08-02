import 'dart:convert';

import 'package:http/http.dart';
import 'package:movil_app/service/common/claim.dart';
import 'package:movil_app/service/service_routes.dart';

class ServiceClaims{

  static Future<bool> createClaim(final String correo, final int idPremio) async {
    final Response response = await get(Uri.parse(Routes.routeClaimCreate(correo, idPremio)));
    return (response.statusCode == 200);
  }

  static Future<Claim> getClaim(final String idUsuario) async {
    final Response response = await get(Uri.parse(Routes.routeClaimRead(idUsuario)));
    return Claim.fromJson(json.decode(response.body));
  }
}