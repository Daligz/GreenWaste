import 'package:http/http.dart';
import 'package:movil_app/service/service_routes.dart';

class ServicePoints{
  static Future<bool> createPoints(final String correo) async {
    final Response response = await get(Uri.parse(Routes.routePointsCreate(correo)));
    return (response.statusCode == 200);
  }
}