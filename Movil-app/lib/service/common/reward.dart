class Reward{
  final String nombre, descripcion, imagen;
  final int idPremio, valor, stock;

  //Reward( this.idPremio, this.nombre, this.descripcion, this.imagen, this.valor, this.stock);
  Reward(this.descripcion, this.idPremio, this.valor, this.imagen, this.stock, this.nombre);
  factory Reward.fromJson(final Map<String, dynamic> jsonMap){
    return Reward(
      jsonMap['descripcion'],
      jsonMap['idpremio'],
      jsonMap['valor'],
      jsonMap['imagen'],
      jsonMap['stock'],
      jsonMap['nombre'],
    );
  }
}