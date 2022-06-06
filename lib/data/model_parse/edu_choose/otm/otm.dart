class ModelOtm1 {
  ModelOtm1({
    required this.status,
    required this.data,
  });

  int status;
  Map<String, String> data;

  factory ModelOtm1.fromJson(Map<String, dynamic> json) => ModelOtm1(
        status: json["status"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class DataOTM {
  DataOTM({
    required  this.id,
    required  this.name,
  });

  String id;
  String name;

  factory DataOTM.fromJson(Map<String, dynamic> json) => DataOTM(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
