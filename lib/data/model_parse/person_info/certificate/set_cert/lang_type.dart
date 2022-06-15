
class ModelGetLangType {
  ModelGetLangType({
   required this.status,
   required this.data,
  });

  int status;
  List<DataGetLangType> data;

  factory ModelGetLangType.fromJson(Map<String, dynamic> json) => ModelGetLangType(
    status: json["status"],
    data: List<DataGetLangType>.from(json["data"].map((x) => DataGetLangType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataGetLangType {
  DataGetLangType({
  required this.langId,
  required this.code,
  required this.name,
  });

  dynamic langId;
  dynamic code;
  dynamic name;

  factory DataGetLangType.fromJson(Map<String, dynamic> json) => DataGetLangType(
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