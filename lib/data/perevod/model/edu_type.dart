class ModelGetEduTypePerevod {
  ModelGetEduTypePerevod({
 required   this.status,
 required   this.masseage,
  });

  int status;
  List<DataGetEduTypeMasseage> masseage;

  factory ModelGetEduTypePerevod.fromJson(Map<String, dynamic> json) => ModelGetEduTypePerevod(
    status: json["status"],
    masseage: List<DataGetEduTypeMasseage>.from(json["masseage"].map((x) => DataGetEduTypeMasseage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "masseage": List<dynamic>.from(masseage.map((x) => x.toJson())),
  };
}

class DataGetEduTypeMasseage {
  DataGetEduTypeMasseage({
   required this.name,
   required this.id,
  });

  String name;
  int id;

  factory DataGetEduTypeMasseage.fromJson(Map<String, dynamic> json) => DataGetEduTypeMasseage(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
