class Container {
  final String estado;
  final int idContenedor, idDireccion, idMaterial;

  Container(this.idContenedor, this.idMaterial, this.idDireccion, this.estado);

  factory Container.fromJson(final Map<String, dynamic> jsonMap) {
    return Container(
        jsonMap['idContenedor'],
        jsonMap['idMaterial'],
        jsonMap['idDireccion'],
        jsonMap['estado']
    );
  }
}