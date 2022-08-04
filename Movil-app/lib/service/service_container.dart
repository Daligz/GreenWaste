import 'dart:convert';

import 'package:http/http.dart';
import 'package:movil_app/service/common/materials.dart';
import 'package:movil_app/service/service_routes.dart';

class ServiceContainer{
  static Future<bool> createContainer(
      final int idMaterial,
      final int idDireccion,
      final String estado) async {
    final Response response = await get(Uri.parse(Routes.routeContainerCreate(
        idMaterial, idDireccion, estado)));
    return (response.statusCode == 200);
  }
}