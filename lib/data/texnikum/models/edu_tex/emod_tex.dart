
class ModelEModeEduTexnikum {
  ModelEModeEduTexnikum({
   required this.status,
   required this.masseage,
  });

  dynamic status;
  List<Masseage> masseage;

  factory ModelEModeEduTexnikum.fromJson(Map<String, dynamic> json) => ModelEModeEduTexnikum(
    status: json["status"],
    masseage: List<Masseage>.from(json["masseage"].map((x) => Masseage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "masseage": List<dynamic>.from(masseage.map((x) => x.toJson())),
  };
}

class Masseage {
  Masseage({
  required  this.name,
  required  this.id,
  });

  dynamic name;
  dynamic id;

  factory Masseage.fromJson(Map<String, dynamic> json) => Masseage(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
