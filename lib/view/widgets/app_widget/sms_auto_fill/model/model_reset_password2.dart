class ModelResetPassToken2 {
  ModelResetPassToken2({
 required   this.status,
 required   this.data,
  });

  int status;
  DataResetPassToken2 data;

  factory ModelResetPassToken2.fromJson(Map<String, dynamic> json) => ModelResetPassToken2(
    status: json["status"],
    data: DataResetPassToken2.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataResetPassToken2 {
  DataResetPassToken2({
   required this.passwordResetToken,
  });

  String passwordResetToken;

  factory DataResetPassToken2.fromJson(Map<String, dynamic> json) => DataResetPassToken2(
    passwordResetToken: json["password_reset_token"],
  );

  Map<String, dynamic> toJson() => {
    "password_reset_token": passwordResetToken,
  };
}
