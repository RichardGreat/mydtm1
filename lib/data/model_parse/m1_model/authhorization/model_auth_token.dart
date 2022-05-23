class ModelUserToken {
  ModelUserToken({
  required  this.status,
  required  this.data,
  });

  int status;
  DataUserToken data;

  factory ModelUserToken.fromJson(Map<String, dynamic> json) => ModelUserToken(
    status: json["status"],
    data: DataUserToken.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataUserToken {
  DataUserToken({
  required  this.authorizationCode,
  required  this.expiresAt,
  });

  String authorizationCode;
  int expiresAt;

  factory DataUserToken.fromJson(Map<String, dynamic> json) => DataUserToken(
    authorizationCode: json["authorization_code"],
    expiresAt: json["expires_at"],
  );

  Map<String, dynamic> toJson() => {
    "authorization_code": authorizationCode,
    "expires_at": expiresAt,
  };
}
