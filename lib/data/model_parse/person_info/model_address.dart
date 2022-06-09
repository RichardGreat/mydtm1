class ModelGetAddress {
  ModelGetAddress({
   required this.status,
   required this.data,
  });

  int status;
  DataGetAddress data;

  factory ModelGetAddress.fromJson(Map<String, dynamic> json) => ModelGetAddress(
    status: json["status"],
    data: DataGetAddress.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataGetAddress {
  DataGetAddress({
  required  this.regionId,
  required  this.regionName,
  required  this.districtId,
  required  this.districtName,
  required  this.address,
  });

  int regionId;
  String regionName;
  int districtId;
  String districtName;
  String address;

  factory DataGetAddress.fromJson(Map<String, dynamic> json) => DataGetAddress(
    regionId: json["region_id"],
    regionName: json["region_name"],
    districtId: json["district_id"],
    districtName: json["district_name"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "region_id": regionId,
    "region_name": regionName,
    "district_id": districtId,
    "district_name": districtName,
    "address": address,
  };
}
