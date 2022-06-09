class ModelCertificateForServer {
  String certId;
  String userValue;
  String certName;
  String certBall;
  String cerId;
  String isChecked;

  ModelCertificateForServer(
      {required this.userValue,
      required this.certId,
      required this.certName,
      required this.certBall,
      required this.cerId,
      required this.isChecked,
      });

  factory ModelCertificateForServer.fromJson(Map<String, dynamic> json) =>
      ModelCertificateForServer(
        userValue: json["value"],
        certId: json["id"],
        certName: json["cert_name"],
        certBall: json["cert_ball"],
        cerId: json["cer_id"],
        isChecked: json["is_check"],
      );

  Map<String, dynamic> toJson() => {
        "id": certId,
        "value": userValue,
        "cert_name": certName,
        "cert_ball": certBall,
        "cer_id": cerId,
        "is_check": isChecked,

      };
}
