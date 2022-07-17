class ModelGetEduPerevod {
  ModelGetEduPerevod({
  required  this.status,
    required   this.education,
  });

  int status;
  List<DataGetEduPerevod> education;

  factory ModelGetEduPerevod.fromJson(Map<String, dynamic> json) => ModelGetEduPerevod(
    status: json["status"],
    education: List<DataGetEduPerevod>.from(json["education"].map((x) => DataGetEduPerevod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "education": List<dynamic>.from(education.map((x) => x.toJson())),
  };
}

class DataGetEduPerevod {
  DataGetEduPerevod({
   required this.name,
   required this.langId,
  });

  String name;
  int langId;

  factory DataGetEduPerevod.fromJson(Map<String, dynamic> json) => DataGetEduPerevod(
    name: json["name"],
    langId: json["lang_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lang_id": langId,
  };
}
