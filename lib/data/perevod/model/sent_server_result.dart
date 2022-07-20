class ModelDataSendServerPerevod {
  ModelDataSendServerPerevod({
  required  this.status,
  required  this.masseage,
  });

  int status;
  MessageSendServerPerevod masseage;

  factory ModelDataSendServerPerevod.fromJson(Map<String, dynamic> json) => ModelDataSendServerPerevod(
    status: json["status"],
    masseage: MessageSendServerPerevod.fromJson(json["masseage"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "masseage": masseage.toJson(),
  };
}

class MessageSendServerPerevod {
  MessageSendServerPerevod({
 required  this.id,
 required  this.imie,
 required  this.regionId,
 required  this.mvdirName,
 required  this.syear,
 required  this.eduName,
 required  this.image,
 required  this.emodeId,
 required  this.createdAt,
 required  this.updatedAt,
  });

  int id;
  int imie;
  String regionId;
  String mvdirName;
  String syear;
  String eduName;
  String image;
  String emodeId;
  DateTime createdAt;
  UpdatedAt updatedAt;

  factory MessageSendServerPerevod.fromJson(Map<String, dynamic> json) => MessageSendServerPerevod(
    id: json["id"],
    imie: json["imie"],
    regionId: json["region_id"],
    mvdirName: json["mvdir_name"],
    syear: json["syear"],
    eduName: json["edu_name"],
    image: json["image"],
    emodeId: json["emode_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: UpdatedAt.fromJson(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imie": imie,
    "region_id": regionId,
    "mvdir_name": mvdirName,
    "syear": syear,
    "edu_name": eduName,
    "image": image,
    "emode_id": emodeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toJson(),
  };
}

class UpdatedAt {
  UpdatedAt({
   required this.expression,
   required this.params,
  });

  String expression;
  List<dynamic> params;

  factory UpdatedAt.fromJson(Map<String, dynamic> json) => UpdatedAt(
    expression: json["expression"],
    params: List<dynamic>.from(json["params"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "expression": expression,
    "params": List<dynamic>.from(params.map((x) => x)),
  };
}
