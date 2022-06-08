class ModelCheckCertificate {
  ModelCheckCertificate({
    required this.status,
    required this.data,
  });

  int status;
  List<DataCheckCertificate> data;

  factory ModelCheckCertificate.fromJson(Map<String, dynamic> json) =>
      ModelCheckCertificate(
        status: json["status"],
        data: List<DataCheckCertificate>.from(
            json["data"].map((x) => DataCheckCertificate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataCheckCertificate {
  DataCheckCertificate({
    required this.certSernum,
    required this.id,
    required this.ball,
    required this.percent,
    required this.startAt,
    required this.endAt,
    required this.name,
    required this.isCheck,
  });

  String certSernum;
  int id;
  String ball;
  String percent;
  String startAt;
  String endAt;
  String name;
  dynamic isCheck;

  factory DataCheckCertificate.fromJson(Map<String, dynamic> json) =>
      DataCheckCertificate(
        certSernum: json["cert_sernum"],
        id: json["id"],
        ball: json["ball"],
        percent: json["percent"],
        startAt: json["start_at"],
        endAt: json["end_at"],
        name: json["name"],
        isCheck: json["is_check"],
      );

  Map<String, dynamic> toJson() => {
        "cert_sernum": certSernum,
        "id": id,
        "ball": ball,
        "percent": percent,
        "start_at": startAt,
        "end_at": endAt,
        "name": name,
        "is_check": isCheck,
      };
}
