class ModelCheckForeignCertificate {
  ModelCheckForeignCertificate({
    required this.status,
    required this.data,
  });

  int status;
  DataCheckForeignCertificate data;

  factory ModelCheckForeignCertificate.fromJson(Map<String, dynamic> json) =>
      ModelCheckForeignCertificate(
        status: json["status"],
        data: DataCheckForeignCertificate.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class DataCheckForeignCertificate {
  DataCheckForeignCertificate({
    required this.serNum,
    required this.flangCertName,
    required this.flangCertId,
    required this.flangLevelName,
    required this.flangLevelId,
    required this.status,
    required this.statusName,
    required this.givenDate,
    required this.flangId,
    required this.flangName,
  });

  String serNum;
  String flangCertName;
  String flangCertId;
  String flangLevelName;
  String flangLevelId;
  String status;
  String statusName;
  String givenDate;
  String flangId;
  String flangName;

  factory DataCheckForeignCertificate.fromJson(Map<String, dynamic> json) =>
      DataCheckForeignCertificate(
        serNum: json["ser_num"],
        flangCertName: json["flang_cert_name"],
        flangCertId: json["flang_cert_id"],
        flangLevelName: json["flang_level_name"],
        flangLevelId: json["flang_level_id"],
        status: json["status"],
        statusName: json["status_name"],
        givenDate: json["given_date"],
        flangId: json["flang_id"],
        flangName: json["flang_name"],
      );

  Map<String, dynamic> toJson() => {
        "ser_num": serNum,
        "flang_cert_name": flangCertName,
        "flang_cert_id": flangCertId,
        "flang_level_name": flangLevelName,
        "flang_level_id": flangLevelId,
        "status": status,
        "status_name": statusName,
        "given_date": givenDate,
        "flang_id": flangId,
        "flang_name": flangName,
      };
}
