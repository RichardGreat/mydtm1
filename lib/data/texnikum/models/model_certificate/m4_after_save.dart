class ModelSaveCertificateTexnikum {
  ModelSaveCertificateTexnikum({
  required  this.status,
  required  this.masseage,
  });

  int status;
  Masseage masseage;

  factory ModelSaveCertificateTexnikum.fromJson(Map<String, dynamic> json) => ModelSaveCertificateTexnikum(
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
  required  this.serNum,
  required  this.flangLevelId,
  required  this.status,
  required  this.givenDate,
  required  this.userId,
  required  this.checkedDate,
  required  this.raiting,
  required  this.comment,
  required  this.word,
  required  this.createdAt,
  required  this.updatedAt,
  required  this.image,
  });

  dynamic id;
  dynamic imie;
  dynamic serNum;
  dynamic flangLevelId;
  dynamic status;
  dynamic givenDate;
  dynamic userId;
  dynamic checkedDate;
  dynamic raiting;
  dynamic comment;
  dynamic word;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic image;

  factory Masseage.fromJson(Map<String, dynamic> json) => Masseage(
    id: json["id"],
    imie: json["imie"],
    serNum: json["ser_num"],
    flangLevelId: json["flang_level_id"],
    status: json["status"],
    givenDate: json["given_date"],
    userId: json["user_id"],
    checkedDate: json["checked_date"],
    raiting: json["raiting"],
    comment: json["comment"],
    word: json["word"],
    createdAt: json["created_at"],
    updatedAt: UpdatedAt.fromJson(json["updated_at"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imie": imie,
    "ser_num": serNum,
    "flang_level_id": flangLevelId,
    "status": status,
    "given_date": givenDate,
    "user_id": userId,
    "checked_date": checkedDate,
    "raiting": raiting,
    "comment": comment,
    "word": word,
    "created_at": createdAt,
    "updated_at": updatedAt.toJson(),
    "image": image,
  };
}

class UpdatedAt {
  UpdatedAt({
  required  this.expression,
  required  this.params,
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
