class ModelAuthorizationParse {
  ModelAuthorizationParse({
  required  this.status,
    required  this.data,
  });

  int status;
  DataAuthorizationParse data;

  factory ModelAuthorizationParse.fromJson(Map<String, dynamic> json) => ModelAuthorizationParse(
    status: json["status"],
    data: DataAuthorizationParse.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataAuthorizationParse {
  DataAuthorizationParse({
    required this.authorizationCode,
    required  this.expiresAt,
  });

  String authorizationCode;
  int expiresAt;

  factory DataAuthorizationParse.fromJson(Map<String, dynamic> json) => DataAuthorizationParse(
    authorizationCode: json["authorization_code"],
    expiresAt: json["expires_at"],
  );

  Map<String, dynamic> toJson() => {
    "authorization_code": authorizationCode,
    "expires_at": expiresAt,
  };
}
