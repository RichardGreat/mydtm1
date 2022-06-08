class ModelCheckPrivilege {
  ModelCheckPrivilege({
  required  this.status,
  required  this.data,
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
   required this.startDate,
   required this.endDate,
   required this.serNum,
   required this.typeName,
   required this.orgName,
  });

  dynamic startDate;
  dynamic endDate;
  dynamic serNum;
  dynamic typeName;
  dynamic orgName;

  factory DataCheckPrivilege.fromJson(Map<String, dynamic> json) => DataCheckPrivilege(
    startDate: json["start_date"],
    endDate: json["end_date"],
    serNum: json["ser_num"],
    typeName: json["type_name"],
    orgName: json["org_name"],
  );

  Map<String, dynamic> toJson() => {
    "start_date": startDate,
    "end_date": endDate,
    "ser_num": serNum,
    "type_name": typeName,
    "org_name": orgName,
  };
}
