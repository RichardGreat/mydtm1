class ModelEmodeNewPerevod {
  ModelEmodeNewPerevod({
   required this.status,
   required this.masseage,
  });

  int status;
  List<DataMassageNewPerevod> masseage;

  factory ModelEmodeNewPerevod.fromJson(Map<String, dynamic> json) => ModelEmodeNewPerevod(
    status: json["status"],
    masseage: List<DataMassageNewPerevod>.from(json["masseage"].map((x) => DataMassageNewPerevod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "masseage": List<dynamic>.from(masseage.map((x) => x.toJson())),
  };
}

class DataMassageNewPerevod {
  DataMassageNewPerevod({
   required this.name,
   required this.id,
  });

  String name;
  int id;

  factory DataMassageNewPerevod.fromJson(Map<String, dynamic> json) => DataMassageNewPerevod(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
