class ModelGraduatedYear {
  ModelGraduatedYear({
    required this.status,
    required this.data,
  });

  int status;
  DataGraduatedYear data;

  factory ModelGraduatedYear.fromJson(Map<String, dynamic> json) =>
      ModelGraduatedYear(
        status: json["status"],
        data: DataGraduatedYear.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class DataGraduatedYear {
  DataGraduatedYear({
    required this.beginYear,
    required this.endYear,
  });

  String beginYear;
  String endYear;

  factory DataGraduatedYear.fromJson(Map<String, dynamic> json) =>
      DataGraduatedYear(
        beginYear: json["begin_year"],
        endYear: json["end_year"],
      );

  Map<String, dynamic> toJson() => {
        "begin_year": beginYear,
        "end_year": endYear,
      };
}
