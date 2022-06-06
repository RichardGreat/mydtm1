class ModelDir1 {
  ModelDir1({
    required this.status,
    required this.data,
  });

  int status;
  List<DataDir1 > data;

  factory ModelDir1.fromJson(Map<String, dynamic> json) => ModelDir1(
        status: json["status"],
        data: List<DataDir1 >.from(json["data"].map((x) => DataDir1 .fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataDir1  {
  DataDir1 ({
    required this.id,
    required this.name,
    required this.flangId,
  });

  int id;
  String name;
  int flangId;

  factory DataDir1 .fromJson(Map<String, dynamic> json) => DataDir1 (
        id: json["id"],
        name: json["name"],
        flangId: json["flang_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "flang_id": flangId,
      };
}
