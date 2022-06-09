
class ModelRegistration2 {
  ModelRegistration2({
  required  this.status,
  required  this.errorCode,
  required  this.errors,
  });

  int status;
  int errorCode;
  String errors;

  factory ModelRegistration2.fromJson(Map<String, dynamic> json) => ModelRegistration2(
    status: json["status"],
    errorCode: json["error_code"],
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error_code": errorCode,
    "errors": errors,
  };
}
