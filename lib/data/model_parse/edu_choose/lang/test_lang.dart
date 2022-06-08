class ModelLangTest {
  ModelLangTest({
   required this.status,
    required this.data,
  });

  int status;
  Map<String, String> data;

  factory ModelLangTest.fromJson(Map<String, dynamic> json) => ModelLangTest(
    status: json["status"],
    data: Map.from(json["data"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
