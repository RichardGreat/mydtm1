class ModelTestRegionPerevod {
  ModelTestRegionPerevod({
    required this.status,
    required this.testRegion,
  });

  int status;
  List<DataTestRegion> testRegion;

  factory ModelTestRegionPerevod.fromJson(Map<String, dynamic> json) =>
      ModelTestRegionPerevod(
        status: json["status"],
        testRegion: List<DataTestRegion>.from(
            json["test_region"].map((x) => DataTestRegion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "test_region": List<dynamic>.from(testRegion.map((x) => x.toJson())),
      };
}

class DataTestRegion {
  DataTestRegion({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory DataTestRegion.fromJson(Map<String, dynamic> json) => DataTestRegion(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
