
class ModelEduLangNewPerevod {
  ModelEduLangNewPerevod({
  required  this.status,
  required  this.lang,
  });

  int status;
  List<DataLangNewPerevod> lang;

  factory ModelEduLangNewPerevod.fromJson(Map<String, dynamic> json) => ModelEduLangNewPerevod(
    status: json["status"],
    lang: List<DataLangNewPerevod>.from(json["lang"].map((x) => DataLangNewPerevod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "lang": List<dynamic>.from(lang.map((x) => x.toJson())),
  };
}

class DataLangNewPerevod {
  DataLangNewPerevod({
 required   this.name,
 required   this.langId,
  });

  String name;
  int langId;

  factory DataLangNewPerevod.fromJson(Map<String, dynamic> json) => DataLangNewPerevod(
    name: json["name"],
    langId: json["lang_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lang_id": langId,
  };
}
