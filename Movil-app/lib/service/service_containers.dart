import 'dart:convert';

import 'package:http/http.dart';
import 'package:movil_app/service/common/containers.dart';
import 'package:movil_app/service/service_routes.dart';

class ServiceConteiners {
  static Future<List<Containers>?> getContainers(int idUsuario) async {
    final Response response = await get(
        Uri.parse(Routes.routeContainersRead(idUsuario)));
    if (response.statusCode != 200) return List.empty();
    return (json.decode(response.body) as List).map((e) => Containers.fromJson(e)).toList();
  }
}