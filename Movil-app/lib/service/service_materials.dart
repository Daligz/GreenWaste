import 'dart:convert';

import 'package:http/http.dart';
import 'package:movil_app/service/common/materials.dart';
import 'package:movil_app/service/service_routes.dart';

class ServiceMaterials{
  static Future<List<Materials>?> getMaterials() async{
    final Response response = await get(Uri.parse(Routes.routeMaterialsReadAll()));
    if(response.statusCode != 200) return List.empty();
    return (json.decode(response.body) as List).map((e) => Materials.fromJson(e)).toList();
  }
}