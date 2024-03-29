// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart';
import 'package:movil_app/service/common/user.dart';
import 'package:movil_app/service/common/address.dart';
import 'package:movil_app/service/common/containers.dart';
import 'package:movil_app/service/service_routes.dart';

class Service {
  static Future<bool> createUser(
      final String nombre,
      final String apellidoPaterno,
      final String apellidoMaterno,
      final String telefono,
      final String correo,
      final String psw) async {
    final Response response = await get(Uri.parse(Routes.routeUserCreate(
        nombre, apellidoPaterno, apellidoMaterno, telefono, correo, psw, 1)));
    //final Response response = await get(Uri.parse("http://localhost:6969/users/create/$nombre/$apellidoPaterno/$apellidoMaterno/$telefono/$correo/$psw/1"));
    return (response.statusCode == 200);
  }

  static Future<User?> loginUser(final String correo, final String psw) async {
    final Response response =
        await get(Uri.parse(Routes.routeUserLogin(correo, psw)));
    print(response.body);
    if (response.body == "[]") {
      return null;
    }
    return (User.fromJson(json.decode(response.body)[0]));
  }

  static Future<User?> readUser(final int idUsuario) async {
    final Response response =
        await get(Uri.parse(Routes.routeUserRead(idUsuario)));
    if (response.body == "[]") {
      return null;
    }
    return (User.fromJson(json.decode(response.body)[0]));
  }

  static Future<bool> updateUser(
      final int idUsuario,
      final String nombre,
      final String apellidoPaterno,
      final String apellidoMaterno,
      final String telefono,
      final String correo,
      final String psw) async {
    final Response response = await get(Uri.parse(Routes.routeUserUpdate(
        idUsuario,
        nombre,
        apellidoPaterno,
        apellidoMaterno,
        telefono,
        correo,
        psw)));
    print(response.statusCode == 200);
    return (response.statusCode == 200);
  }

  static Future<bool> createAddress(
      final String colonia,
      final String calle,
      final String numero,
      final String municipio,
      final String estado,
      final int idUsuario) async {
    final Response response = await get(Uri.parse(Routes.routeAddressCreate(
        colonia, calle, numero, municipio, estado, idUsuario)));
    return (response.statusCode == 200);
  }


  static Future<List<Address>?> readAddress(final int idUsuario) async {
    final Response response = await get(Uri.parse(Routes.routeAddressRead(idUsuario)));
    if(response.statusCode != 200) return List.empty();
    return (json.decode(response.body) as List).map((e) => Address.fromJson(e)).toList();
  }

  static Future<List<Containers>?> readContainers(final int idUsuario) async {
    final Response response = await get(Uri.parse(Routes.routeContainersRead(idUsuario)));
    if(response.statusCode != 200) return List.empty();
    return (json.decode(response.body) as List).map((e) => Containers.fromJson(e)).toList();
  }

  static Future<bool> updateContainers(
      final int idContenedor,
      final String estado) async {
    final Response response = await get(Uri.parse(Routes.routeContainersUpdate(
        idContenedor,
        estado)));
    print(response.statusCode == 200);
    return (response.statusCode == 200);
  }


  static Future<bool> updateAddress(
      final int idDireccion,
      final String colonia,
      final String calle,
      final String numero,
      final String municipio,
      final String estado,
      final int idUsuario) async {
    final Response response = await get(Uri.parse(Routes.routeAddressUpdate(
        idDireccion, colonia, calle, numero, municipio, estado, idUsuario)));
    print(response.statusCode == 200);
    return (response.statusCode == 200);
  }
}
