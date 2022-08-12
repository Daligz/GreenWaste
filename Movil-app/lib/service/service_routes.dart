class Routes {
  static const String _url = "http://192.168.0.14:6969";

  // User routes
  static String routeUserCreate(
          final String nombre,
          final String apellidoPaterno,
          final String apellidoMaterno,
          final String telefono,
          final String correo,
          final String psw,
          final int idRol) =>
      _url +
      "/users/create/$nombre/$apellidoPaterno/$apellidoMaterno/$telefono/$correo/$psw/$idRol";

  static String routeUserLogin(final String correo, final String psw) =>
      _url + "/users/login/$correo/$psw";

  static String routeUserUpdate(
          final int idUsuario,
          final String nombre,
          final String apellidoPaterno,
          final String apellidoMaterno,
          final String telefono,
          final String correo,
          final String psw) =>
      _url +
      "/users/update/$idUsuario/$nombre/$apellidoPaterno/$apellidoMaterno/$telefono/$correo/$psw/1";

  static String routeContainersUpdate(
      final int idContenedor,
      final String estado) =>
      _url +
          "/containers/update/$idContenedor/$estado";

  static String routeUserRead(final int idUsuario) =>
      _url + "/users/read/$idUsuario";



  // Rewards routes
  static String routeRewardsRead() => _url + "/rewards/read";

  // Points routes
  static String routePointsCreate(final String correo) =>
      _url + "/points/create/$correo";

  static String routePointsUpdate(
          final int idUsuario, final int puntos, final int idPremio) =>
      _url + "/points/update/$idUsuario/$puntos/$idPremio";

  // Claims routes
  static String routeClaimCreate(final String correo, final int idPremio) =>
      _url + "/claims/create/$correo/$idPremio";

  static String routeClaimRead(final String idUsuario) =>
      _url + "/claims/read/$idUsuario";

  //Address routes
  static String routeAddressRead(final int idUsuario) => _url + "/address/read/$idUsuario";

  static String routeAddressCreate(
      final String colonia,
      final String calle,
      final String numero,
      final String municipio,
      final String estado,
      final int idUsuario) =>
      _url +
          "/address/create/$colonia/$calle/$numero/$municipio/$estado/$idUsuario";

  static String routeAddressUpdate(
          final int idDireccion,
          final String colonia,
          final String calle,
          final String numero,
          final String municipio,
          final String estado,
          final int idUsuario) =>
      _url +
      "/address/update/$idDireccion/$colonia/$calle/$numero/$municipio/$estado/$idUsuario";

  //Materials routes
  static String routeMaterialsReadAll() => _url + "/materials/read";

  static String routeMaterialsRead(final int idMaterial) => _url + "/material/read/$idMaterial";


  //Container routes
  static String routeContainerCreate(
      final int idMaterial,
      final int idDireccion,
      final String estado) =>
      _url +
          "/containers/create/$idMaterial/$idDireccion/$estado";

  static String routeContainersRead(final int idUsuario) => _url + "/containers/read/$idUsuario";
}
