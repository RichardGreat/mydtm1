class ModelAddInvalid {
  ModelAddInvalid({
 required   this.status,
 required   this.data,
  });

  int status;
  List<String> data;

  factory ModelAddInvalid.fromJson(Map<String, dynamic> json) => ModelAddInvalid(
    status: json["status"],
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
