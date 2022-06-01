class ModelGraduatedCountry {
  ModelGraduatedCountry({
 required   this.status,
 required   this.data,
  });

  int status;
  List<DataGraduatedCountry> data;

  factory ModelGraduatedCountry.fromJson(Map<String, dynamic> json) => ModelGraduatedCountry(
    status: json["status"],
    data: List<DataGraduatedCountry>.from(json["data"].map((x) => DataGraduatedCountry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataGraduatedCountry {
  DataGraduatedCountry({
  required this.id,
  required this.name,
  });

  int id;
  String name;

  factory DataGraduatedCountry.fromJson(Map<String, dynamic> json) => DataGraduatedCountry(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
