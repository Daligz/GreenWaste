class Routes{
  static const String _url = "localhost:6969";

  // User routes
  static String routeUserCreate(final String nombre,
      final String apellidoPaterno, final String apellidoMaterno,
      final String telefono, final String correo, final String psw,
      final int idRol) => _url + "/users/create/$nombre/$apellidoPaterno/$apellidoMaterno/$telefono/$correo/$psw/$idRol";
}