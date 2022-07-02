class ModelCheckPrivilege {
  ModelCheckPrivilege({
   required this.status,
   required this.data,
  });

  int status;
  List<DataCheckPrivilege> data;

  factory ModelCheckPrivilege.fromJson(Map<String, dynamic> json) => ModelCheckPrivilege(
    status: json["status"],
    data: List<DataCheckPrivilege>.from(json["data"].map((x) => DataCheckPrivilege.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataCheckPrivilege {
  DataCheckPrivilege({
  required  this.typeId,
  required  this.startDate,
  required  this.endDate,
  required  this.serNum,
  required  this.status,
  required  this.typeName,
  required  this.orgName,
  });

  dynamic typeId;
  dynamic startDate;
  dynamic endDate;
  dynamic serNum;
  dynamic status;
  dynamic typeName;
  dynamic orgName;

  factory DataCheckPrivilege.fromJson(Map<String, dynamic> json) => DataCheckPrivilege(
    typeId: json["type_id"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    serNum: json["ser_num"],
    status: json["status"],
    typeName: json["type_name"],
    orgName: json["org_name"],
  );

  Map<String, dynamic> toJson() => {
    "type_id": typeId,
    "start_date": startDate,
    "end_date": endDate,
    "ser_num": serNum,
    "status": status,
    "type_name": typeName,
    "org_name": orgName,
  };
}
