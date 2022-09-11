class UsuarioCadastro {
  final String nome;
  final String email;
  final String senha;
  final int anoNasc;
  final int peso;
  final int altura;
  final String alergias;
  final String objetivos;
  final int? id;

UsuarioCadastro({
    required this.nome;
    required this.email,
    required this.senha,
    required this.anoNasc;
    required this.peso;
    required this.altura;
    required this.alergias;
    required this.objetivos;
    required this.id,
  });

factory UsuarioCadastro.fromJson(Map<String, dynamic> json) {
    return UsuarioCadastro(
      id: json["id"],
      nome: json["nome"],
      email: json["email"],
      senha: json["senha"],
      anoNasc: json["anoNasc"],
      peso: json["peso"],
      altura: json["altura"],
      alergias: json["alergias"],
      objetivos: json["objetivos"],
    );
  }
Map<String, dynamic> get toJson => {
        "id": id.toString(),
        "email": email,
        "senha": senha,
        "anoNasc": anoNasc.toString(),
        "peso": peso.toString(),
        "altura": altura.toString(),
        "alergias": alergias,
        "objetivos": objetivos,
      };
}