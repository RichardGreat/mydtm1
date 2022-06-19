class ModelEduChooseRegion {
  ModelEduChooseRegion({
    required this.status,
    required this.data,
  });

  int status;
  Map<String, String> data;

  factory ModelEduChooseRegion.fromJson(Map<String, dynamic> json) =>
      ModelEduChooseRegion(
        status: json["status"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class ListModelEduChooseRegion {
   dynamic regionId;
   dynamic regionName;

  ListModelEduChooseRegion({required this.regionId, required this.regionName});

  factory ListModelEduChooseRegion.fromJson(Map<String, dynamic> json) =>
      ListModelEduChooseRegion(
        regionId: json["region_id"],
        regionName: json["region_name"]);

  Map<String, dynamic> toJson() => {
    "region_id": regionId,
    "rgion_name": regionName
  };
}
