class ModelEduLangPerevod {
  ModelEduLangPerevod({
    required this.status,
    required this.lang,
  });

  int status;
  List<DataLangOldPerevod> lang;

  factory ModelEduLangPerevod.fromJson(Map<String, dynamic> json) =>
      ModelEduLangPerevod(
        status: json["status"],
        lang: List<DataLangOldPerevod>.from(json["lang"].map((x) => DataLangOldPerevod.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "lang": List<dynamic>.from(lang.map((x) => x.toJson())),
      };
}

class DataLangOldPerevod {
  DataLangOldPerevod({
    required this.name,
    required this.langId,
  });

  String name;
  int langId;

  factory DataLangOldPerevod.fromJson(Map<String, dynamic> json) => DataLangOldPerevod(
        name: json["name"],
        langId: json["lang_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lang_id": langId,
      };
}
