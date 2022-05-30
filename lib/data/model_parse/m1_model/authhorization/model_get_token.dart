class ModelGetToken {
  ModelGetToken({
    required this.status,
    required this.data,
  });

  int status;
  DataGetToken data;

  factory ModelGetToken.fromJson(Map<String, dynamic> json) => ModelGetToken(
        status: json["status"],
        data: DataGetToken.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class DataGetToken {
  DataGetToken({
    required this.accessToken,
    required this.expiresAt,
  });

  String accessToken;
  int expiresAt;

  factory DataGetToken.fromJson(Map<String, dynamic> json) => DataGetToken(
        accessToken: json["access_token"],
        expiresAt: json["expires_at"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "expires_at": expiresAt,
      };
}
