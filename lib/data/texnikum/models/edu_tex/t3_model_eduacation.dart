class ModelEducationTexnikum {
  ModelEducationTexnikum({
    required this.status,
    required this.education,
  });

  int status;
  List<DataEducationTexnikum> education;

  factory ModelEducationTexnikum.fromJson(Map<String, dynamic> json) =>
      ModelEducationTexnikum(
        status: json["status"],
        education: List<DataEducationTexnikum>.from(
            json["education"].map((x) => DataEducationTexnikum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
      };
}

class DataEducationTexnikum {
  DataEducationTexnikum({
    required this.name,
    required this.langId,
  });

  String name;
  int langId;

  factory DataEducationTexnikum.fromJson(Map<String, dynamic> json) => DataEducationTexnikum(
        name: json["name"],
        langId: json["lang_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lang_id": langId,
      };
}
