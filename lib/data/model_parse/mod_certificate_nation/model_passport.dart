class ModelPassport {
  ModelPassport({
    required this.status,
    required this.errorCode,
    required this.errors,
  });

 dynamic status;
 dynamic errorCode;
 dynamic errors;

  factory ModelPassport.fromJson(Map<String, dynamic> json) => ModelPassport(
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
