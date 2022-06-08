class ModelCertificateForServer {
  String certId;
  String userValue;
  String certName;
  String certBall;

  ModelCertificateForServer(
      {required this.userValue,
      required this.certId,
      required this.certName,
      required this.certBall});

  factory ModelCertificateForServer.fromJson(Map<String, dynamic> json) =>
      ModelCertificateForServer(
        userValue: json["value"],
        certId: json["id"],
        certName: json["cert_name"],
        certBall: json["cert_ball"],
      );

  Map<String, dynamic> toJson() => {
        "id": certId,
        "value": userValue,
        "cert_name": certName,
        "cert_ball": certBall
      };
}
