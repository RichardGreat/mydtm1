
class ModelGraduatedInfo {
  ModelGraduatedInfo({
  required this.status,
  required this.data,
  });

  int status;
  DataGraduatedInfo data;

  factory ModelGraduatedInfo.fromJson(Map<String, dynamic> json) => ModelGraduatedInfo(
    status: json["status"],
    data: DataGraduatedInfo.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataGraduatedInfo {
  DataGraduatedInfo({
  required this.id,
  required this.regionId,
  required this.countryId,
  required this.countryName,
  required this.regionName,
  required this.districtId,
  required this.districtName,
  required this.docSerNum,
  required this.graduatedYear,
  required this.eduName,
  required this.eduTypeId,
  required this.gName,
  });

  int id;
  int regionId;
  int countryId;
  String countryName;
  String regionName;
  int districtId;
  String districtName;
  String docSerNum;
  int graduatedYear;
  dynamic eduName;
  int eduTypeId;
  String gName;

  factory DataGraduatedInfo.fromJson(Map<String, dynamic> json) => DataGraduatedInfo(
    id: json["id"],
    regionId: json["region_id"],
    countryId: json["country_id"],
    countryName: json["country_name"],
    regionName: json["region_name"],
    districtId: json["district_id"],
    districtName: json["district_name"],
    docSerNum: json["doc_ser_num"],
    graduatedYear: json["graduated_year"],
    eduName: json["edu_name"],
    eduTypeId: json["edu_type_id"],
    gName: json["g_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "region_id": regionId,
    "country_id": countryId,
    "country_name": countryName,
    "region_name": regionName,
    "district_id": districtId,
    "district_name": districtName,
    "doc_ser_num": docSerNum,
    "graduated_year": graduatedYear,
    "edu_name": eduName,
    "edu_type_id": eduTypeId,
    "g_name": gName,
  };
}
