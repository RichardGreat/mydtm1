class ModelCreateCert {
  ModelCreateCert({
    required this.status,
    required this.data,
  });

  int status;
  DataCreateCert data;

  factory ModelCreateCert.fromJson(Map<String, dynamic> json) => ModelCreateCert(
    status: json["status"],
    data: DataCreateCert.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataCreateCert {
  DataCreateCert({
    required this.taskId,
  });

  int taskId;

  factory DataCreateCert.fromJson(Map<String, dynamic> json) => DataCreateCert(
    taskId: json["task_id"],
  );

  Map<String, dynamic> toJson() => {
    "task_id": taskId,
  };
}
