class ModelEduNewPerevod {
  ModelEduNewPerevod({
   required this.status,
   required this.education,
  });

  int status;
  List<Education> education;

  factory ModelEduNewPerevod.fromJson(Map<String, dynamic> json) => ModelEduNewPerevod(
    status: json["status"],
    education: List<Education>.from(json["education"].map((x) => Education.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "education": List<dynamic>.from(education.map((x) => x.toJson())),
  };
}

class Education {
  Education({
  required this.name,
  required this.langId,
  });

  String name;
  int langId;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    name: json["name"],
    langId: json["lang_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lang_id": langId,
  };
}
