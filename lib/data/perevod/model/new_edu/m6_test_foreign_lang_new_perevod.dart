class ModelTestLangNewPerevod {
  ModelTestLangNewPerevod({
  required  this.status,
  required  this.mvdir,
  });

  int status;
  List<DataMvdirLangNewPerevod> mvdir;

  factory ModelTestLangNewPerevod.fromJson(Map<String, dynamic> json) => ModelTestLangNewPerevod(
    status: json["status"],
    mvdir: List<DataMvdirLangNewPerevod>.from(json["mvdir"].map((x) => DataMvdirLangNewPerevod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mvdir": List<dynamic>.from(mvdir.map((x) => x.toJson())),
  };
}

class DataMvdirLangNewPerevod {
  DataMvdirLangNewPerevod({
 required  this.name,
 required  this.id,
  });

  String name;
  int id;

  factory DataMvdirLangNewPerevod.fromJson(Map<String, dynamic> json) => DataMvdirLangNewPerevod(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
