class ModelLangEduChoose {
  ModelLangEduChoose({
  required  this.status,
  required  this.data,
  });

  int status;
  List<DataLangEduChoose> data;

  factory ModelLangEduChoose.fromJson(Map<String, dynamic> json) => ModelLangEduChoose(
    status: json["status"],
    data: List<DataLangEduChoose>.from(json["data"].map((x) => DataLangEduChoose.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataLangEduChoose {
  DataLangEduChoose({
  required  this.id,
  required  this.name,
  });

  int id;
  String name;

  factory DataLangEduChoose.fromJson(Map<String, dynamic> json) => DataLangEduChoose(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
