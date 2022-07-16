// To parse this JSON data, do
//
//     final modelGetEduPerevod = modelGetEduPerevodFromJson(jsonString);

import 'dart:convert';

ModelGetEduPerevod modelGetEduPerevodFromJson(String str) => ModelGetEduPerevod.fromJson(json.decode(str));

String modelGetEduPerevodToJson(ModelGetEduPerevod data) => json.encode(data.toJson());

class ModelGetEduPerevod {
  ModelGetEduPerevod({
  required  this.status,
    required   this.education,
  });

  int status;
  List<Education> education;

  factory ModelGetEduPerevod.fromJson(Map<String, dynamic> json) => ModelGetEduPerevod(
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
