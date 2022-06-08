class ModelLangTest {
  ModelLangTest({
   required this.status,
    required this.data,
  });

  int status;
  Map<String, String> data;

  factory ModelLangTest.fromJson(Map<String, dynamic> json) => ModelLangTest(
    status: json["status"],
    data: Map.from(json["data"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class DataForeignLang{
  String id, name;
  DataForeignLang({required this.id, required this.name});

  factory DataForeignLang.fromJson({ required Map<String, dynamic> json}) => DataForeignLang(id: json["id"], name:json["name"]);


  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name
  };
}
