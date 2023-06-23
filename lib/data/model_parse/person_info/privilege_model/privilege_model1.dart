class ModelCheckPrivilege {
  int status;
  List<DataCheckPrivilege> data;

  ModelCheckPrivilege({
    required this.status,
    required this.data,
  });

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
  dynamic startDate;
  dynamic endDate;
  dynamic serNum;
  dynamic typeName;

  DataCheckPrivilege({
    required this.startDate,
    required this.endDate,
    required this.serNum,
    required this.typeName,
  });

  factory DataCheckPrivilege.fromJson(Map<String, dynamic> json) => DataCheckPrivilege(
    startDate:json["start_date"]??"",
    endDate:json["end_date"]??"",
    serNum: json["ser_num"]??"",
    typeName: json["type_name"]??"",
  );

  Map<String, dynamic> toJson() => {
    "start_date": startDate,
    "end_date": endDate,
    "ser_num": serNum,
    "type_name": typeName,
  };
}
