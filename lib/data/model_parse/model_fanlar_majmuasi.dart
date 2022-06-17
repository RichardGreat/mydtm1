class ModelFanMasjmua {
  ModelFanMasjmua({
  required  this.status,
  required  this.data,
  });

  int status;
  DataFanMasjmua data;

  factory ModelFanMasjmua.fromJson(Map<String, dynamic> json) => ModelFanMasjmua(
    status: json["status"],
    data: DataFanMasjmua.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataFanMasjmua {
  DataFanMasjmua({
 required  this.main,
 required  this.required,
  });

  MainDataFanMasjmua main;
  List<RequiredDataFanMasjmua> required;

  factory DataFanMasjmua.fromJson(Map<String, dynamic> json) => DataFanMasjmua(
    main: MainDataFanMasjmua.fromJson(json["main"]),
    required: List<RequiredDataFanMasjmua>.from(json["required"].map((x) => RequiredDataFanMasjmua.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "main": main.toJson(),
    "required": List<dynamic>.from(required.map((x) => x.toJson())),
  };
}

class MainDataFanMasjmua {
  MainDataFanMasjmua({
   required this.b1,
   required this.b2,
  });

  B1DataFanMasjmua b1;
  B1DataFanMasjmua b2;

  factory MainDataFanMasjmua.fromJson(Map<String, dynamic> json) => MainDataFanMasjmua(
    b1: B1DataFanMasjmua.fromJson(json["b1"]),
    b2: B1DataFanMasjmua.fromJson(json["b2"]),
  );

  Map<String, dynamic> toJson() => {
    "b1": b1.toJson(),
    "b2": b2.toJson(),
  };
}

class B1DataFanMasjmua {
  B1DataFanMasjmua({
  required  this.name,
  required  this.count,
  required  this.ball,
  required  this.totalBall,
  });

  String name;
  int count;
  double ball;
  int totalBall;

  factory B1DataFanMasjmua.fromJson(Map<String, dynamic> json) => B1DataFanMasjmua(
    name: json["name"],
    count: json["count"],
    ball: json["ball"].toDouble(),
    totalBall: json["total_ball"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "count": count,
    "ball": ball,
    "total_ball": totalBall,
  };
}

class RequiredDataFanMasjmua {
  RequiredDataFanMasjmua({
   required this.nameUz,
   required this.nameRu,
   required this.nameQq,
   required this.count,
   required this.ball,
   required this.totalBall,
  });

  String nameUz;
  String nameRu;
  String nameQq;
  int count;
  double ball;
  int totalBall;

  factory RequiredDataFanMasjmua.fromJson(Map<String, dynamic> json) => RequiredDataFanMasjmua(
    nameUz: json["name_uz"],
    nameRu: json["name_ru"],
    nameQq: json["name_qq"],
    count: json["count"],
    ball: json["ball"].toDouble(),
    totalBall: json["total_ball"],
  );

  Map<String, dynamic> toJson() => {
    "name_uz": nameUz,
    "name_ru": nameRu,
    "name_qq": nameQq,
    "count": count,
    "ball": ball,
    "total_ball": totalBall,
  };
}
