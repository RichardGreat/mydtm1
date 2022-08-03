class ModelEducationDirTexnikum {
  ModelEducationDirTexnikum({
  required this.status,
  required this.mvdir,
  });

  int status;
  List<DataMvdirTexnikum> mvdir;

  factory ModelEducationDirTexnikum.fromJson(Map<String, dynamic> json) => ModelEducationDirTexnikum(
    status: json["status"],
    mvdir: List<DataMvdirTexnikum>.from(json["mvdir"].map((x) => DataMvdirTexnikum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "mvdir": List<dynamic>.from(mvdir.map((x) => x.toJson())),
  };
}

class DataMvdirTexnikum {
  DataMvdirTexnikum({
  required  this.name,
  required  this.langId,
  });

  String name;
  int langId;

  factory DataMvdirTexnikum.fromJson(Map<String, dynamic> json) => DataMvdirTexnikum(
    name: json["name"],
    langId: json["lang_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lang_id": langId,
  };
}
