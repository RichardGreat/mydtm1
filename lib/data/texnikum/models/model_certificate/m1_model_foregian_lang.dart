class ModelForeignLangTexnikum {
  ModelForeignLangTexnikum({
  required  this.status,
  required  this.data,
  });

  int status;
  List<DataForeignLangTexnikum> data;

  factory ModelForeignLangTexnikum.fromJson(Map<String, dynamic> json) => ModelForeignLangTexnikum(
    status: json["status"],
    data: List<DataForeignLangTexnikum>.from(json["data"].map((x) => DataForeignLangTexnikum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataForeignLangTexnikum {
  DataForeignLangTexnikum({
  required  this.code,
  required  this.name,
  });

  int code;
  String name;

  factory DataForeignLangTexnikum.fromJson(Map<String, dynamic> json) => DataForeignLangTexnikum(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}
