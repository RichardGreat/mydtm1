class ModelCheckCertificate {
  dynamic status;
  dynamic count;
  dynamic message;
  List<DataCheckCertificate> data;

  ModelCheckCertificate({
    required this.status,
    required this.count,
    required this.message,
    required this.data,
  });

  factory ModelCheckCertificate.fromJson(Map<String, dynamic> json) => ModelCheckCertificate(
    status: json["status"],
    count: json["count"],
    message: json["message"],
    data: List<DataCheckCertificate>.from(json["data"].map((x) => DataCheckCertificate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataCheckCertificate {
  dynamic lname;
  dynamic fname;
  dynamic mname;
  dynamic  imie;
  dynamic  psser;
  dynamic  psnum;
  dynamic  subjectName;
  dynamic  level;
  dynamic  commonBall;
  dynamic  endDate;
  dynamic  startDate;
  dynamic  serNum;
  dynamic  certLink;
  dynamic  certSer;
  dynamic  certNumber;
  dynamic  personId;
  dynamic  ball;
  dynamic  percent;
  dynamic  startAt;
  dynamic  endAt;
  dynamic  scienceName;
  dynamic  scienceId;
  dynamic  url;

  DataCheckCertificate({
    required this.lname,
    required this.fname,
    required this.mname,
    this.imie,
    this.psser,
    this.psnum,
    this.subjectName,
    this.level,
    this.commonBall,
    this.endDate,
    this.startDate,
    this.serNum,
    this.certLink,
    this.certSer,
    this.certNumber,
    this.personId,
    this.ball,
    this.percent,
    this.startAt,
    this.endAt,
    this.scienceName,
    this.scienceId,
    this.url,
  });

  factory DataCheckCertificate.fromJson(Map<String, dynamic> json) => DataCheckCertificate(
    lname: json["lname"]??"",
    fname: json["fname"] +" "+json["mname"]+" "+json["mname"],
    mname: json["mname"]??"",
    imie: json["imie"]??"",
    psser: json["psser"]??"",
    psnum: json["psnum"]??"",
    subjectName: json["subject_name"]??json["science_name"],
    level: json["level"]??"",
    commonBall: json["common_ball"],
    endDate: json["end_date"]??"",
    startDate: json["start_date"]??"",
    serNum: json["ser_num"]??"",
    certLink: json["cert_link"]??"",
    certSer: json["cert_ser"]??"",
    certNumber: json["cert_number"]??"",
    personId: json["person_id"]??"",
    ball: json["ball"]?? json["common_ball"],
    percent: json["percent"]??"",
    startAt: json["start_at"]??"",
    endAt: json["end_at"]??"",
    scienceName: json["science_name"],
    scienceId: json["science_id"]??"",
    url: json["url"]??"",
  );

  Map<String, dynamic> toJson() => {
    "lname": lname,
    "fname": fname,
    "mname": mname,
    "imie": imie,
    "psser": psser,
    "psnum": psnum,
    "subject_name": subjectName,
    "level": level,
    "common_ball": commonBall,
    "end_date": endDate,
    "start_date": startDate,
    "ser_num": serNum,
    "cert_link": certLink,
    "cert_ser": certSer,
    "cert_number": certNumber,
    "person_id": personId,
    "ball": ball,
    "percent": percent,
    "start_at": startAt,
    "end_at": endAt,
    "science_name": scienceName,
    "science_id": scienceId,
    "url": url,
  };
}
