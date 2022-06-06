class ModelEmodeGet {
  ModelEmodeGet({
    required this.status,
    required this.data,
  });

  int status;
  Map<String, String> data;

  factory ModelEmodeGet.fromJson(Map<String, dynamic> json) => ModelEmodeGet(
        status: json["status"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
class DataEmodeChoose {
  DataEmodeChoose({
    required  this.id,
    required  this.name,
  });

  String id;
  String name;

  factory DataEmodeChoose.fromJson(Map<String, dynamic> json) => DataEmodeChoose(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
