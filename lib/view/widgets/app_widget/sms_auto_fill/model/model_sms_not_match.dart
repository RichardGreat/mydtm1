class ModelSmsNotMatch {
  ModelSmsNotMatch({
    required this.status,
    required this.errorCode,
    required this.errors,
  });

  int status;
  int errorCode;
  String errors;

  factory ModelSmsNotMatch.fromJson(Map<String, dynamic> json) => ModelSmsNotMatch(
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
