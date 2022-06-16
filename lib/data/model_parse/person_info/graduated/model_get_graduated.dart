class ModelEduGraduated {
  ModelEduGraduated({
  required  this.status,
  required  this.data,
  });

  int status;
  DataEduGraduated data;

  factory ModelEduGraduated.fromJson(Map<String, dynamic> json) => ModelEduGraduated(
    status: json["status"],
    data: DataEduGraduated.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataEduGraduated {
  DataEduGraduated({
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
  required this.oldeduId,
  required this.gName,
  });

  dynamic id;
  dynamic regionId;
  dynamic countryId;
  dynamic countryName;
  dynamic regionName;
  dynamic districtId;
  dynamic districtName;
  dynamic docSerNum;
  dynamic graduatedYear;
  dynamic eduName;
  dynamic eduTypeId;
  dynamic oldeduId;
  dynamic gName;

  factory DataEduGraduated.fromJson(Map<String, dynamic> json) => DataEduGraduated(
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
    oldeduId: json["oldedu_id"],
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
    "oldedu_id": oldeduId,
    "g_name": gName,
  };
}
