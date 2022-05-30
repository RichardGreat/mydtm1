class ModelGetCountry {
  ModelGetCountry({
    required this.status,
    required this.data,
  });

  int status;
  List<DataGetCountry> data;

  factory ModelGetCountry.fromJson(Map<String, dynamic> json) =>
      ModelGetCountry(
        status: json["status"],
        data: List<DataGetCountry>.from(
            json["data"].map((x) => DataGetCountry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataGetCountry {
  DataGetCountry({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory DataGetCountry.fromJson(Map<String, dynamic> json) => DataGetCountry(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
