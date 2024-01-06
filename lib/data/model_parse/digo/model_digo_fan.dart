class ModelGetFan {
  dynamic status;
  List<DataDigoFan> data;

  ModelGetFan({
    required this.status,
    required this.data,
  });

  factory ModelGetFan.fromJson(Map<String, dynamic> json) => ModelGetFan(
    status: json["status"],
    data: List<DataDigoFan>.from(json["data"].map((x) => DataDigoFan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataDigoFan {
  dynamic id;
  dynamic name;

  DataDigoFan({
     this.id,
     this.name,
  });

  factory DataDigoFan.fromJson(Map<String, dynamic> json) => DataDigoFan(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
