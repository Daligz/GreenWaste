class Claim {
  final int usedPoints;
  final List<RewardData> rewardData;

  Claim(this.usedPoints, this.rewardData);

  factory Claim.fromJson(final Map<String, dynamic> jsonMap) {
    print(jsonMap['rewardData']);
    return Claim(
      jsonMap['usedPoints'],
      RewardData.build(jsonMap['rewardData'])
    );
  }
}

class RewardData {

  final String nombre, descripcion, imagen;
  final int valor, stock;

  RewardData(this.nombre, this.descripcion, this.imagen, this.valor, this.stock);

  static List<RewardData> build(final String data) {

    return List.empty();
  }

  factory RewardData.fromJson(final Map<String, dynamic> jsonMap) {
    return RewardData(
      jsonMap['nombre'],
      jsonMap['descripcion'],
      jsonMap['imagen'],
      jsonMap['valor'],
      jsonMap['stock'],
    );
  }
}