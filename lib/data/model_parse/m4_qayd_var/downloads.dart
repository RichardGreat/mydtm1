
class ModelGetDownloads {
  ModelGetDownloads({
  required this.status,
  required this.data,
  });

  int status;
  DataGetDownloads data;

  factory ModelGetDownloads.fromJson(Map<String, dynamic> json) => ModelGetDownloads(
    status: json["status"],
    data: DataGetDownloads.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataGetDownloads {
  DataGetDownloads({
  required  this.src,
  });

  String src;

  factory DataGetDownloads.fromJson(Map<String, dynamic> json) => DataGetDownloads(
    src: json["src"],
  );

  Map<String, dynamic> toJson() => {
    "src": src,
  };
}

class ModelGetDownloads2 {
  int status;
  String src;

  ModelGetDownloads2({
    required this.status,
    required this.src,
  });

  factory ModelGetDownloads2.fromJson(Map<String, dynamic> json) => ModelGetDownloads2(
    status: json["status"],
    src: json["src"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "src": src,
  };
}
