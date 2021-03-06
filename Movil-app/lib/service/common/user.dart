class User {
  final String nombre, apellidoPaterno, apellidoMaterno, telefono, correo, psw;
  final int idUsuario, idRol;

  User(this.idUsuario, this.nombre, this.apellidoPaterno, this.apellidoMaterno, this.telefono, this.correo, this.psw, this.idRol);


  factory User.fromJson(final Map<String, dynamic> jsonMap) {
    return User(
      jsonMap['idusuario'],
      jsonMap['nombre'],
      jsonMap['apellidopaterno'],
      jsonMap['apellidomaterno'],
      jsonMap['telefono'],
      jsonMap['correo'],
      jsonMap['psw'],
      jsonMap['idrol']
    );
  }
}