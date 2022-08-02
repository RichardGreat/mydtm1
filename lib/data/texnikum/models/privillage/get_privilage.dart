class ModelGetPrivilageTexnikum {
  ModelGetPrivilageTexnikum({
    required this.status,
    required this.masseage,
  });

  int status;
  MassagePrivilageTexnikum masseage;

  factory ModelGetPrivilageTexnikum.fromJson(Map<String, dynamic> json) =>
      ModelGetPrivilageTexnikum(
        status: json["status"],
        masseage: MassagePrivilageTexnikum.fromJson(json["masseage"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "masseage": masseage.toJson(),
      };
}

class MassagePrivilageTexnikum {
  MassagePrivilageTexnikum({
    required this.id,
    required this.imie,
    required this.ser,
    required this.num,
    required this.typeId,
    required this.createAt,
    required this.updateAt,
    required this.img,
    required this.sdate,
    required this.status,
    required this.api,
  });

  dynamic id;
  dynamic imie;
  dynamic ser;
  dynamic num;
  dynamic typeId;
  dynamic createAt;
  dynamic updateAt;
  dynamic img;
  dynamic sdate;
  dynamic status;
  dynamic api;

  factory MassagePrivilageTexnikum.fromJson(Map<String, dynamic> json) =>
      MassagePrivilageTexnikum(
        id: json["id"],
        imie: json["imie"],
        ser: json["ser"],
        num: json["num"],
        typeId: json["type_id"],
        createAt: json["create_at"],
        updateAt: json["update_at"],
        img: json["img"],
        sdate: json["sdate"],
        status: json["status"],
        api: json["api"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imie": imie,
        "ser": ser,
        "num": num,
        "type_id": typeId,
        "create_at": createAt,
        "update_at": updateAt,
        "img": img,
        "sdate": sdate,
        "status": status,
        "api": api,
      };
}
