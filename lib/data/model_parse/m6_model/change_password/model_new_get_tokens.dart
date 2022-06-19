class ModelAccessNewPassport {
  ModelAccessNewPassport({
required   this.status,
required   this.data,
  });

  int status;
  DataAccessNewPassport data;

  factory ModelAccessNewPassport.fromJson(Map<String, dynamic> json) => ModelAccessNewPassport(
    status: json["status"],
    data: DataAccessNewPassport.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataAccessNewPassport {
  DataAccessNewPassport({
 required this.accessToken,
 required this.expiresAt,
  });

  String accessToken;
  int expiresAt;

  factory DataAccessNewPassport.fromJson(Map<String, dynamic> json) => DataAccessNewPassport(
    accessToken: json["access_token"],
    expiresAt: json["expires_at"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "expires_at": expiresAt,
  };
}
