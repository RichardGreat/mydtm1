class ModelEduMvDirPerevod {
  ModelEduMvDirPerevod({
  required  this.status,
  required  this.mvdir,
  });

  int status;
  List<DataMvdirPerevod> mvdir;

  factory ModelEduMvDirPerevod.fromJson(Map<String, dynamic> json) => ModelEduMvDirPerevod(
    status: json["status"],
    mvdir: List<DataMvdirPerevod>.from(json["mvdir"].map((x) => DataMvdirPerevod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mvdir": List<dynamic>.from(mvdir.map((x) => x.toJson())),
  };
}

class DataMvdirPerevod {
  DataMvdirPerevod({
  required  this.name,
  required  this.langId,
  });

  String name;
  int langId;

  factory DataMvdirPerevod.fromJson(Map<String, dynamic> json) => DataMvdirPerevod(
    name: json["name"],
    langId: json["lang_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lang_id": langId,
  };
}
