class Materials {
  final String nombre;
  final double costo;
  final int idMaterial;

  Materials(this.idMaterial, this.nombre, this.costo);

  factory Materials.fromJson(final Map<String, dynamic> jsonMap) {
    return Materials(
        jsonMap['idMaterial'],
        jsonMap['nombre'],
        jsonMap['costo']
    );
  }
}