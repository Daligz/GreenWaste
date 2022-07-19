class Routes{
  
  static const String _url = "http://192.168.0.5:6969";

  // User routes
  static String routeUserCreate(final String nombre,
      final String apellidoPaterno, final String apellidoMaterno,
      final String telefono, final String correo, final String psw,
      final int idRol) => _url + "/users/create/$nombre/$apellidoPaterno/$apellidoMaterno/$telefono/$correo/$psw/$idRol";

  static String routeUserLogin(final String correo, final String psw) => _url + "/users/login/$correo/$psw";

  static String routeUserUpdate(final int idUsuario, final String nombre,
      final String apellidoPaterno, final String apellidoMaterno,
      final String telefono, final String correo,
      final String psw) => _url + "/users/update/$idUsuario/$nombre/$apellidoPaterno/$apellidoMaterno/$telefono/$correo/$psw/1";

  static String routeUserRead(final int idUsuario) => _url + "/users/read/$idUsuario";
}