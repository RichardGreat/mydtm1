class ModelGetCountryPerevod {
  ModelGetCountryPerevod({
  required this.status,
  required this.masseage,
  });

  int status;
  List<DataGetCountryPerevod> masseage;

  factory ModelGetCountryPerevod.fromJson(Map<String, dynamic> json) => ModelGetCountryPerevod(
    status: json["status"],
    masseage: List<DataGetCountryPerevod>.from(json["masseage"].map((x) => DataGetCountryPerevod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "masseage": List<dynamic>.from(masseage.map((x) => x.toJson())),
  };
}

class DataGetCountryPerevod {
  DataGetCountryPerevod({
  required  this.name,
  required  this.id,
  });

  String name;
  int id;

  factory DataGetCountryPerevod.fromJson(Map<String, dynamic> json) => DataGetCountryPerevod(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
