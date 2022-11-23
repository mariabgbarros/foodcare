class UsuarioCadastro {
  final int id;
  final String nome;
  final String email;
  final String senha;
  final String data_nasc;
  final int peso;
  final int altura;
  final String sexo;
  final int objetivos;


UsuarioCadastro({
    this.id = 0,
    required this.nome,
    required this.email,
    required this.senha,
    required this.data_nasc,
    required this.peso,
    required this.altura,
    required this.sexo,
    required this.objetivos,

  });

factory UsuarioCadastro.fromJson(Map<String, dynamic> json) {
    return UsuarioCadastro(
      id: json["id"],
      nome: json["nome"],
      email: json["email"],
      senha: json["senha"],
      data_nasc: json["data_nasc"],
      peso: json["peso"],
      altura: json["altura"],
      sexo: json["sexo"],
      objetivos: json["objetivo_id"],
    );
  }
Map<String, dynamic> get toJson => {
        "nome": nome,
        "email": email,
        "senha": senha,
        "data_nasc": data_nasc,
        "peso": peso,
        "altura": altura,
        "sexo": sexo,
        "objetivo_id": objetivos,
      };
}