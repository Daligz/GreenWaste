class Routes{
  
  static const String _url = "http://192.168.0.14:6969";

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


  static String routeAddressCreate(final String colonia, final String calle, final String numero, final String municipio,
      final String estado,final int idUsuario)=> _url+"/address/create/$colonia/$calle/$numero/$municipio/$estado/$idUsuario";

  static String routeAddressRead(final int idUsuario)=> _url + "/address/read/$idUsuario";


}