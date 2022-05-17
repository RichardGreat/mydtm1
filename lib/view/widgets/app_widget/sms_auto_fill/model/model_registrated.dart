class ModelRegistrationHave {
  ModelRegistrationHave({
  required   this.status,
  required  this.errorCode,
  required   this.errors,
  });

  dynamic status;
  dynamic errorCode;
  Errors errors;

  factory ModelRegistrationHave.fromJson(Map<String, dynamic> json) => ModelRegistrationHave(
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
   required this.username,
  });

  List<String> username;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    username: List<String>.from(json["username"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "username": List<dynamic>.from(username.map((x) => x)),
  };
}
