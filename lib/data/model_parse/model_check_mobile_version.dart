class ModelCheckMobileVersion {
  ModelCheckMobileVersion({
    required this.status,
    required this.data,
  });

  int status;
  DataCheckMobileVersion data;

  factory ModelCheckMobileVersion.fromJson(Map<String, dynamic> json) =>
      ModelCheckMobileVersion(
        status: json["status"],
        data: DataCheckMobileVersion.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class DataCheckMobileVersion {
  DataCheckMobileVersion({
    required this.id,
    required this.status,
    required this.version,
    required this.versionText,
    required this.versionTextQq,
    required this.versionTextRu,
  });

  dynamic id;
  dynamic status;
  dynamic version;
  dynamic versionText;
  dynamic versionTextQq;
  dynamic versionTextRu;

  factory DataCheckMobileVersion.fromJson(Map<String, dynamic> json) =>
      DataCheckMobileVersion(
          id: json["id"],
          status: json["status"],
          version: json["version"],
          versionText: json["version_text"],
          versionTextQq: json["version_text_qq"],
          versionTextRu: json["version_text_ru"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "version": version,
        "version_text": versionText,
        "version_text_qq": versionTextQq,
        "version_text_ru": versionTextRu
      };
}
