class ModelGetGraduatedName {
  int status;
  List<DataGetGraduatedName> data;

  ModelGetGraduatedName({
    required this.status,
    required this.data,
  });

  factory ModelGetGraduatedName.fromJson(Map<String, dynamic> json) => ModelGetGraduatedName(
    status: json["status"],
    data: List<DataGetGraduatedName>.from(json["data"].map((x) => DataGetGraduatedName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataGetGraduatedName {
  int id;
  String name;

  DataGetGraduatedName({
    required this.id,
    required this.name,
  });

  factory DataGetGraduatedName.fromJson(Map<String, dynamic> json) => DataGetGraduatedName(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}


class ModelGetGraduatedNameError {
  ModelGetGraduatedNameError({
   required this.status,
   required this.errorCode,
   required this.errors,
  });

  int status;
  int errorCode;
  String errors;

  factory ModelGetGraduatedNameError.fromJson(Map<String, dynamic> json) => ModelGetGraduatedNameError(
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
