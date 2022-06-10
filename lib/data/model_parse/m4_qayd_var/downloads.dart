
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
