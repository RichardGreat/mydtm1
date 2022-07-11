class ModelUpdate2022 {
  ModelUpdate2022({
  required  this.status,
    required this.data,
  });

  int status;
  DataUpdate2022 data;

  factory ModelUpdate2022.fromJson(Map<String, dynamic> json) => ModelUpdate2022(
    status: json["status"],
    data: DataUpdate2022.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataUpdate2022 {
  DataUpdate2022({
    required   this.message,
  });

  String message;

  factory DataUpdate2022.fromJson(Map<String, dynamic> json) => DataUpdate2022(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
