class ModelGetNewsBody {
  ModelGetNewsBody({
    required this.body,
  });

  String body;

  factory ModelGetNewsBody.fromJson(Map<String, dynamic> json) =>
      ModelGetNewsBody(
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "body": body,
      };
}
