class ModelCertApplications {
  ModelCertApplications({
    required this.status,
    required this.data,
  });

  int status;
  List<DataCertApplications> data;

  factory ModelCertApplications.fromJson(Map<String, dynamic> json) => ModelCertApplications(
    status: json["status"],
    data: List<DataCertApplications>.from(json["data"].map((x) => DataCertApplications.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataCertApplications {
  DataCertApplications({
    required this.id,
    required this.imie,
    required this.invoice,
    required this.pay,
    required this.testDay,
    required this.testRegionName,
    required this.testLangName,
    required this.createdAt,
  });

 dynamic id;
 dynamic imie;
 dynamic invoice;
 dynamic pay;
 dynamic testDay;
 dynamic testRegionName;
 dynamic testLangName;
 dynamic createdAt;

  factory DataCertApplications.fromJson(Map<String, dynamic> json) => DataCertApplications(
    id: json["id"]??"",
    imie: json["imie"]??"",
    invoice: json["invoice"]??"",
    pay: json["pay"]??"",
    testDay:json["test_day"]??"",
    testRegionName: json["test_region_name"]??"",
    testLangName: json["test_lang_name"]??"",
    createdAt: json["created_at"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imie": imie,
    "invoice": invoice,
    "pay": pay,
    "test_day": testDay,
    "test_region_name": testRegionName,
    "test_lang_name": testLangName,
    "created_at": createdAt,
  };
}
