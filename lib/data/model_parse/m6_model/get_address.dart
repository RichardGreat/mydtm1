class ModelGetAddressInfo {
  ModelGetAddressInfo({
    required this.status,
    required this.data,
  });

  int status;
  DataGetAddressInfo data;

  factory ModelGetAddressInfo.fromJson(Map<String, dynamic> json) =>
      ModelGetAddressInfo(
        status: json["status"],
        data: DataGetAddressInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class DataGetAddressInfo {
  DataGetAddressInfo({
    required this.regionId,
    required this.regionName,
    required this.districtId,
    required this.districtName,
    required this.address,
  });

  int regionId;
  String regionName;
  int districtId;
  String districtName;
  String address;

  factory DataGetAddressInfo.fromJson(Map<String, dynamic> json) =>
      DataGetAddressInfo(
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
