class ModelForeignLangTypeTexnikum {
  ModelForeignLangTypeTexnikum({
 required  this.status,
 required  this.data,
  });

  int status;
  List<DataLangTypeTexnikum> data;

  factory ModelForeignLangTypeTexnikum.fromJson(Map<String, dynamic> json) => ModelForeignLangTypeTexnikum(
    status: json["status"],
    data: List<DataLangTypeTexnikum>.from(json["data"].map((x) => DataLangTypeTexnikum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataLangTypeTexnikum {
  DataLangTypeTexnikum({
  required this.langId,
  required this.code,
  required this.name,
  });

  int langId;
  int code;
  String name;

  factory DataLangTypeTexnikum.fromJson(Map<String, dynamic> json) => DataLangTypeTexnikum(
    langId: json["lang_id"],
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "lang_id": langId,
    "code": code,
    "name": name,
  };
}
