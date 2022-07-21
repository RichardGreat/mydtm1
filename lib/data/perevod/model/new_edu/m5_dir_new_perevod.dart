class ModelDirNewPerevod {
  ModelDirNewPerevod({
  required  this.status,
  required  this.mvdir,
  });

  int status;
  List<DataMvdirNewPerevod> mvdir;

  factory ModelDirNewPerevod.fromJson(Map<String, dynamic> json) => ModelDirNewPerevod(
    status: json["status"],
    mvdir: List<DataMvdirNewPerevod>.from(json["mvdir"].map((x) => DataMvdirNewPerevod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mvdir": List<dynamic>.from(mvdir.map((x) => x.toJson())),
  };
}

class DataMvdirNewPerevod {
  DataMvdirNewPerevod({
  required this.name,
  required this.langId,
  });

  String name;
  int langId;

  factory DataMvdirNewPerevod.fromJson(Map<String, dynamic> json) => DataMvdirNewPerevod(
    name: json["name"],
    langId: json["lang_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lang_id": langId,
  };
}
