class Containers{
  final String estado, nombre;
  final int idContenedor;

  Containers(this.estado, this.idContenedor, this.nombre);

  factory Containers.fromJson(final Map<String, dynamic> jsonMap) {
    return Containers(
        jsonMap['estado'],
        jsonMap['idcontenedor'],
        jsonMap['nombre']
    );
  }
}