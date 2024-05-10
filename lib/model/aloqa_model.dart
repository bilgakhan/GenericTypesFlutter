class AloqaModel {
  String g1;
  String g2;
  String g3;
  String g4;
  String g5;

  AloqaModel({
    required this.g1,
    required this.g2,
    required this.g3,
    required this.g4,
    required this.g5,
  });

  factory AloqaModel.fromJson(Map<String, dynamic> json) => AloqaModel(
        g1: json["G1"],
        g2: json["G2"],
        g3: json["G3"],
        g4: json["G4"],
        g5: json["G5"],
      );

  Map<String, dynamic> toJson() => {
        "G1": g1,
        "G2": g2,
        "G3": g3,
        "G4": g4,
        "G5": g5,
      };
}
