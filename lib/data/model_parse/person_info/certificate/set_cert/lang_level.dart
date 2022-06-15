class ModelGetLangLevel {
  ModelGetLangLevel({
required    this.status,
    required  this.data,
  });

  int status;
  List<DataGetLangLevel> data;

  factory ModelGetLangLevel.fromJson(Map<String, dynamic> json) => ModelGetLangLevel(
    status: json["status"],
    data: List<DataGetLangLevel>.from(json["data"].map((x) => DataGetLangLevel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataGetLangLevel {
  DataGetLangLevel({
  required this.langCertId,
  required this.code,
  required this.name,
  required this.level,
  });

  int langCertId;
  int code;
  String name;
  int level;

  factory DataGetLangLevel.fromJson(Map<String, dynamic> json) => DataGetLangLevel(
    langCertId: json["lang_cert_id"],
    code: json["code"],
    name: json["name"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "lang_cert_id": langCertId,
    "code": code,
    "name": name,
    "level": level,
  };
}
