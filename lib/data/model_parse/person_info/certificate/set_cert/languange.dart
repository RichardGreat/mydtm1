
class ModelGetForeignLang {
  ModelGetForeignLang({
  required  this.status,
  required  this.data,
  });

  int status;
  List<DataGetForeignLang> data;

  factory ModelGetForeignLang.fromJson(Map<String, dynamic> json) => ModelGetForeignLang(
    status: json["status"],
    data: List<DataGetForeignLang>.from(json["data"].map((x) => DataGetForeignLang.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataGetForeignLang {
  DataGetForeignLang({
   required this.code,
   required this.name,
  });

  int code;
  String name;

  factory DataGetForeignLang.fromJson(Map<String, dynamic> json) => DataGetForeignLang(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}
