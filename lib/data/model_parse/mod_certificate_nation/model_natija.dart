class ModelCertificateResults {
  ModelCertificateResults({
    required this.status,
    required this.data,
  });

  int status;
  DataCertificateResults data;

  factory ModelCertificateResults.fromJson(Map<String, dynamic> json) => ModelCertificateResults(
    status: json["status"],
    data: DataCertificateResults.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataCertificateResults {
  DataCertificateResults({
    required this.answer,
  });

  Answer answer;

  factory DataCertificateResults.fromJson(Map<String, dynamic> json) => DataCertificateResults(
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
    required this.maxBall,
  });

  double ball;
  String name;
  double maxBall;

  factory An.fromJson(Map<String, dynamic> json) => An(
    ball: json["ball"]?.toDouble(),
    name: json["name"],
    maxBall: json["max_ball"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "ball": ball,
    "name": name,
    "max_ball": maxBall,
  };
}
