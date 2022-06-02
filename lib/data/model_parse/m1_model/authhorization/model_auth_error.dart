class ModelErrorUserName {
  ModelErrorUserName({
 required   this.status,
 required   this.errorCode,
 required   this.errors,
  });

  int status;
  int errorCode;
  Errors errors;

  factory ModelErrorUserName.fromJson(Map<String, dynamic> json) => ModelErrorUserName(
    status: json["status"],
    errorCode: json["error_code"],
    errors: Errors.fromJson(json["errors"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error_code": errorCode,
    "errors": errors.toJson(),
  };
}

class Errors {
  Errors({
   required this.password,
  });

  List<String> password;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    password: List<String>.from(json["password"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "password": List<dynamic>.from(password.map((x) => x)),
  };
}
