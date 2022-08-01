class ModelForeignLangDegreeTexnikum {
  ModelForeignLangDegreeTexnikum({
    required this.status,
    required this.data,
  });

  int status;
  List<DataForeignLangDegreeTexnikum> data;

  factory ModelForeignLangDegreeTexnikum.fromJson(Map<String, dynamic> json) =>
      ModelForeignLangDegreeTexnikum(
        status: json["status"],
        data: List<DataForeignLangDegreeTexnikum>.from(
            json["data"].map((x) => DataForeignLangDegreeTexnikum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataForeignLangDegreeTexnikum {
  DataForeignLangDegreeTexnikum({
    required this.langCertId,
    required this.code,
    required this.name,
    required this.level,

  });

  int langCertId;
  int code;
  String name;
  int level;

  factory DataForeignLangDegreeTexnikum.fromJson(Map<String, dynamic> json) =>
      DataForeignLangDegreeTexnikum(
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
