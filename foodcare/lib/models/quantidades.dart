class Quantidades {
  final int qtd_cal;
  final int qtd_prot;
  final int qtd_lip;
  final int qtd_carb;

Quantidades ({
    required this.qtd_cal,
    required this.qtd_prot,
    required this.qtd_lip,
    required this.qtd_carb,

  });

factory Quantidades.fromJson(Map<String, dynamic> json) {
    return Quantidades(
      qtd_cal: json["qtd_cal"],
      qtd_carb: json["qtd_carb"],
      qtd_lip: json["qtd_lip"],
      qtd_prot: json["qtd_prot"],
    );
  }
Map<String, dynamic> get toJson => {
        "qtd_cal": qtd_cal.toString(),
        "qtd_lip": qtd_lip.toString(),
        "qtd_carb": qtd_carb.toString(),
        "qtd_prot": qtd_prot.toString(),
      };
}