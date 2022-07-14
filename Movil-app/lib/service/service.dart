import 'package:http/http.dart';
import 'package:movil_app/service/service_routes.dart';

class Service {
  Future<bool> createUser(final String nombre,
      final String apellidoPaterno, final String apellidoMaterno,
      final String telefono, final String correo, final String psw) async{
    final Response response = await get(Uri.parse(Routes.routeUserCreate(nombre, apellidoPaterno, apellidoMaterno, telefono, correo, psw, 1)));
    return (response.statusCode == 200);
  }
}