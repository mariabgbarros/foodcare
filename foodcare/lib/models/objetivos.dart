class UsuarioLogin {
  final String email;
  final String senha;
  final int? id;

UsuarioLogin({
    required this.email,
    required this.senha,
    required this.id,
  });

factory UsuarioLogin.fromJson(Map<String, dynamic> json) {
    return UsuarioLogin(
      id: json["id"],
      email: json["email"],
      senha: json["senha"],
    );
  }
Map<String, dynamic> get toJson => {
        "id": id.toString(),
        "email": email,
        "senha": senha,
      };
}