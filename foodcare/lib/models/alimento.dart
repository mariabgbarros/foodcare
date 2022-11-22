class Alimento {
  final String nome;
  final int qtd_g;
  final int? id;

Alimento ({
    required this.nome,
    required this.qtd_g,
    required this.id,
  });

factory Alimento.fromJson(Map<String, dynamic> json) {
    return Alimento(
      id: json["id"],
      nome: json["nome"],
      qtd_g: json["qtd_g"],
    );
  }
Map<String, dynamic> get toJson => {
        "id": id.toString(),
        "nome": nome, 
        "qtd_g": qtd_g
      };
}