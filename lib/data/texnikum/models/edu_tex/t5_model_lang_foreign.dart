class ModelLangForeignTexnikum {
  ModelLangForeignTexnikum({
    required this.status,
    required this.mvdir,
  });

  int status;
  List<DataLangForeignTex> mvdir;

  factory ModelLangForeignTexnikum.fromJson(Map<String, dynamic> json) =>
      ModelLangForeignTexnikum(
        status: json["status"],
        mvdir: List<DataLangForeignTex>.from(
            json["mvdir"].map((x) => DataLangForeignTex.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "mvdir": List<dynamic>.from(mvdir.map((x) => x.toJson())),
      };
}

class DataLangForeignTex {
  DataLangForeignTex({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory DataLangForeignTex.fromJson(Map<String, dynamic> json) =>
      DataLangForeignTex(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
