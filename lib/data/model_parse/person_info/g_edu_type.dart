class ModelGeneralEduType {
  ModelGeneralEduType({
    required this.status,
    required this.data,
  });

  int status;
  List<DataGeneralEduType> data;

  factory ModelGeneralEduType.fromJson(Map<String, dynamic> json) =>
      ModelGeneralEduType(
        status: json["status"],
        data: List<DataGeneralEduType>.from(
            json["data"].map((x) => DataGeneralEduType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataGeneralEduType {
  DataGeneralEduType({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory DataGeneralEduType.fromJson(Map<String, dynamic> json) =>
      DataGeneralEduType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
