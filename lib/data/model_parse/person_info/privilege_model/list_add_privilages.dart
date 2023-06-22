class ListAddPrivilagesAll {
  String startDate;
  String endDate;
  String serNum;
  String typeName;

  ListAddPrivilagesAll({
    required this.startDate,
    required this.endDate,
    required this.serNum,
    required this.typeName,
  });

  factory ListAddPrivilagesAll.fromJson(Map<String, dynamic> json) =>
      ListAddPrivilagesAll(
        startDate: json["start_date"],
        endDate: json["end_date"],
        serNum: json["ser_num"],
        typeName: json["type_name"],
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "ser_num": serNum,
        "type_name": typeName,
      };
}
