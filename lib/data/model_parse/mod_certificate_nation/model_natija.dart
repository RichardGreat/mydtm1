// To parse this JSON data, do
//
//     final modelCertRusults = modelCertRusultsFromJson(jsonString);

import 'dart:convert';

ModelCertRusults modelCertRusultsFromJson(String str) => ModelCertRusults.fromJson(json.decode(str));

String modelCertRusultsToJson(ModelCertRusults data) => json.encode(data.toJson());

class ModelCertRusults {
  ModelCertRusults({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory ModelCertRusults.fromJson(Map<String, dynamic> json) => ModelCertRusults(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.answer,
  });

  Answer answer;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    answer: Answer.fromJson(json["answer"]),
  );

  Map<String, dynamic> toJson() => {
    "answer": answer.toJson(),
  };
}

class Answer {
  Answer({
    required this.getCert,
    required this.subject,
    required this.ans,
    required this.commonBall,
    required this.ballPoint,
    required this.hash,
    required this.link,
  });

  bool getCert;
  String subject;
  List<An> ans;
  String commonBall;
  String ballPoint;
  String hash;
  String link;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    getCert: json["get_cert"],
    subject: json["subject"],
    ans: List<An>.from(json["ans"].map((x) => An.fromJson(x))),
    commonBall: json["common_ball"],
    ballPoint: json["ball_point"],
    hash: json["hash"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "get_cert": getCert,
    "subject": subject,
    "ans": List<dynamic>.from(ans.map((x) => x.toJson())),
    "common_ball": commonBall,
    "ball_point": ballPoint,
    "hash": hash,
    "link": link,
  };
}

class An {
  An({
    required this.ball,
    required this.name,
    this.maxBall,
    this.geometriya,
  });

  double ball;
  String name;
  double? maxBall;
  double? geometriya;

  factory An.fromJson(Map<String, dynamic> json) => An(
    ball: json["ball"]?.toDouble(),
    name: json["name"],
    maxBall: json["max_ball"]?.toDouble(),
    geometriya: json["Geometriya"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "ball": ball,
    "name": name,
    "max_ball": maxBall,
    "Geometriya": geometriya,
  };
}
