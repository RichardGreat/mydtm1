class ModelCertNationRegion {
  ModelCertNationRegion({
    required this.status,
    required this.data,
  });

  late int status;
  late Map<String, String> data;

  factory ModelCertNationRegion.fromJson(Map<String, dynamic> json) =>
      ModelCertNationRegion(
        status: json["status"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
