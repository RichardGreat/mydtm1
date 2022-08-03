class ModelQaydVaraqaTexnikum {
  ModelQaydVaraqaTexnikum({
   required this.status,
   required this.masseage,
  });

  int status;
  Masseage masseage;

  factory ModelQaydVaraqaTexnikum.fromJson(Map<String, dynamic> json) => ModelQaydVaraqaTexnikum(
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
  required  this.id,
  required  this.imie,
  required  this.createAt,
  required  this.updateAt,
  required  this.status,
  required  this.directionId,
  required  this.emodeId,
  required  this.langId,
  required  this.eduId,
  required  this.flang,
  required  this.apiId,
  required  this.eduName,
  required  this.eduDirectionName,
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
 dynamic eduName;
 dynamic eduDirectionName;

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
    eduName: json["edu_name"],
    eduDirectionName: json["edu_direction_name"],
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
    "edu_name": eduName,
    "edu_direction_name": eduDirectionName,
  };
}
