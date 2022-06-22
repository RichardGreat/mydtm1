class PassportAgainStatus {
  PassportAgainStatus({
required    this.status,
    required this.data,
  });

  int status;
  DataAgainStatus data;

  factory PassportAgainStatus.fromJson(Map<String, dynamic> json) => PassportAgainStatus(
    status: json["status"],
    data: DataAgainStatus.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataAgainStatus {
  DataAgainStatus({
    required  this.status,
  });

  int status;

  factory DataAgainStatus.fromJson(Map<String, dynamic> json) => DataAgainStatus(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
