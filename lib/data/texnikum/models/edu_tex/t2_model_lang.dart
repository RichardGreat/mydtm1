class ModelLangEduTexnikum {
  ModelLangEduTexnikum({
    required this.status,
    required this.lang,
  });

  int status;
  List<DataLangEduTexnikum> lang;

  factory ModelLangEduTexnikum.fromJson(Map<String, dynamic> json) =>
      ModelLangEduTexnikum(
        status: json["status"],
        lang: List<DataLangEduTexnikum>.from(
            json["lang"].map((x) => DataLangEduTexnikum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "lang": List<dynamic>.from(lang.map((x) => x.toJson())),
      };
}

class DataLangEduTexnikum {
  DataLangEduTexnikum({
    required this.name,
    required this.langId,
  });

  String name;
  int langId;

  factory DataLangEduTexnikum.fromJson(Map<String, dynamic> json) =>
      DataLangEduTexnikum(
        name: json["name"],
        langId: json["lang_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lang_id": langId,
      };
}
