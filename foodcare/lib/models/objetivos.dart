class Objetivo {
  final String objetivo;
  final int? id;

Objetivo({
    required this.objetivo,
    required this.id,
  });

factory Objetivo.fromJson(Map<String, dynamic> json) {
    return Objetivo(
      id: json["id"],
      objetivo: json["objetivo"],
    );
  }
Map<String, dynamic> get toJson => {
        "id": id.toString(),
        "objetivo": objetivo,
      };
}