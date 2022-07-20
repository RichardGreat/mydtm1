class ModelGetEduPerevod {
  ModelGetEduPerevod({
  required  this.status,
    required   this.education,
  });

  int status;
  List<DataGetEduPerevod> education;

  factory ModelGetEduPerevod.fromJson(Map<String, dynamic> json) => ModelGetEduPerevod(
    status: json["status"],
    education: List<DataGetEduPerevod>.from(json["EduUzb"].map((x) => DataGetEduPerevod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "EduUzb": List<dynamic>.from(education.map((x) => x.toJson())),
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
    langId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": langId,
  };
}
