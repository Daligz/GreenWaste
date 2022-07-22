class Address{
  final String colonia,calle,numero,municipio,estado;
  final int idDireccion, idUsuario;

  Address(this.idDireccion,this.colonia,this.calle,this.numero,this.municipio,this.estado,this.idUsuario);

  factory Address.fromJson(final Map<String, dynamic> jsonMap){
    return Address(
        jsonMap['iddireccion'],
        jsonMap['colonia'],
        jsonMap['calle'],
        jsonMap['numero'],
        jsonMap['municipio'],
        jsonMap['estado'],
        jsonMap['idusuario']
    );
  }
}