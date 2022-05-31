class ModelGetDistrict {
  ModelGetDistrict({
    required this.status,
    required this.data,
  });

  int status;
  List<DataGetDistrict> data;

  factory ModelGetDistrict.fromJson(Map<String, dynamic> json) =>
      ModelGetDistrict(
        status: json["status"],
        data: List<DataGetDistrict>.from(
            json["data"].map((x) => DataGetDistrict.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataGetDistrict {
  DataGetDistrict({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory DataGetDistrict.fromJson(Map<String, dynamic> json) => DataGetDistrict(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
