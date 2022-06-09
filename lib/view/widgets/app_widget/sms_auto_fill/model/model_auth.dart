class ModelAuthSms {
  ModelAuthSms({
  required  this.status,
  required  this.data,
  });

  int status;
  DataAuthSms data;

  factory ModelAuthSms.fromJson(Map<String, dynamic> json) => ModelAuthSms(
    status: json["status"],
    data: DataAuthSms.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataAuthSms {
  DataAuthSms({
    required this.authorizationCode,
    required   this.expiresAt,
  });

  String authorizationCode;
  int expiresAt;

  factory DataAuthSms.fromJson(Map<String, dynamic> json) => DataAuthSms(
    authorizationCode: json["authorization_code"],
    expiresAt: json["expires_at"],
  );

  Map<String, dynamic> toJson() => {
    "authorization_code": authorizationCode,
    "expires_at": expiresAt,
  };
}
