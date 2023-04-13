class ModelCertAllow {
  ModelCertAllow({
    required this.status,
    required this.data,
  });

  int status;
  DataCertAllow data;

  factory ModelCertAllow.fromJson(Map<String, dynamic> json) => ModelCertAllow(
    status: json["status"],
    data: DataCertAllow.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataCertAllow {
  DataCertAllow({
    required this.allow,
  });

  String allow;

  factory DataCertAllow.fromJson(Map<String, dynamic> json) => DataCertAllow(
    allow: json["allow"],
  );

  Map<String, dynamic> toJson() => {
    "allow": allow,
  };
}
