class Refeicoes {
  final String alimentos;
  final int? id;

Refeicoes ({
    required this.alimentos,
    required this.id,
  });

factory Refeicoes.fromJson(Map<String, dynamic> json) {
    return Refeicoes(
      id: json["id"],
      alimentos: json["refeicao"],
    );
  }
Map<String, dynamic> get toJson => {
        "id": id.toString(),
        "refeicao": alimentos,
      };
}