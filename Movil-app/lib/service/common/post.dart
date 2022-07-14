class Post {
  final String nombre, apellidoPaterno, apellidoMaterno, telefono, correo, psw;
  final int idRol;

  Post(this.nombre, this.apellidoPaterno, this.apellidoMaterno, this.telefono, this.correo, this.psw, this.idRol);

  factory Post.fromJson(final Map<String, dynamic> jsonMap) {
    return Post(
      jsonMap['nombre'],
      jsonMap['apellidoPaterno'],
      jsonMap['apellidoMaterno'],
      jsonMap['telefono'],
      jsonMap['correo'],
      jsonMap['psw'],
      jsonMap['idRol']
    );
  }
}