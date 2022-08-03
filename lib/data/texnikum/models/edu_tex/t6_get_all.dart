class ModelGetAllTexnikum {
  ModelGetAllTexnikum({
    required this.status,
    required this.masseage,
  });

  int status;
  Masseage masseage;

  factory ModelGetAllTexnikum.fromJson(Map<String, dynamic> json) =>
      ModelGetAllTexnikum(
        status: json["status"],
        masseage: Masseage.fromJson(json["masseage"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "masseage": masseage.toJson(),
      };
}

class Masseage {
  Masseage({
    required this.id,
    required this.imie,
    required this.createAt,
    required this.updateAt,
    required this.status,
    required this.directionId,
    required this.emodeId,
    required this.langId,
    required this.eduId,
    required this.flang,
    required this.apiId,
  });

 dynamic id;
 dynamic imie;
 dynamic createAt;
 dynamic updateAt;
 dynamic status;
 dynamic directionId;
 dynamic emodeId;
 dynamic langId;
 dynamic eduId;
 dynamic flang;
 dynamic apiId;

  factory Masseage.fromJson(Map<String, dynamic> json) => Masseage(
        id: json["id"],
        imie: json["imie"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: json["update_at"],
        status: json["status"],
        directionId: json["direction_id"],
        emodeId: json["emode_id"],
        langId: json["lang_id"],
        eduId: json["edu_id"],
        flang: json["flang"],
        apiId: json["api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imie": imie,
        "create_at": createAt.toIso8601String(),
        "update_at": updateAt,
        "status": status,
        "direction_id": directionId,
        "emode_id": emodeId,
        "lang_id": langId,
        "edu_id": eduId,
        "flang": flang,
        "api_id": apiId,
      };
}
