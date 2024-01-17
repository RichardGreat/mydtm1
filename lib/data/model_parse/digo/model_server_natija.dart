class ModelGetNatija {
  dynamic status;
  List<DataGetNatija> data;

  ModelGetNatija({
    this.status,
    required this.data,
  });

  factory ModelGetNatija.fromJson(Map<String, dynamic> json) => ModelGetNatija(
        status: json["status"],
        data: List<DataGetNatija>.from(
            json["data"].map((x) => DataGetNatija.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataGetNatija {
  dynamic imie;
  dynamic regionId;
  dynamic invoice;
  dynamic payment;
  dynamic cnt;
  dynamic status;
  dynamic paid;
  dynamic phone;
  dynamic serviceId;
  dynamic getUserId;
  dynamic printUserId;
  dynamic createAt;
  dynamic updateAt;
  dynamic id;

  DataGetNatija({
    this.imie,
    this.regionId,
    this.invoice,
    this.payment,
    this.cnt,
    this.status,
    this.paid,
    this.phone,
    this.serviceId,
    this.getUserId,
    this.printUserId,
    this.createAt,
    this.updateAt,
    this.id,
  });

  factory DataGetNatija.fromJson(Map<String, dynamic> json) => DataGetNatija(
        imie: json["imie"],
        regionId: json["region_id"],
        invoice: json["invoice"],
        payment: json["payment"],
        cnt: json["cnt"],
        status: json["status"],
        paid: json["paid"],
        phone: json["phone"],
        serviceId: json["service_id"],
        getUserId: json["get_user_id"],
        printUserId: json["print_user_id"],
        createAt: AteAt.fromJson(json["create_at"]),
        updateAt: AteAt.fromJson(json["update_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imie": imie,
        "region_id": regionId,
        "invoice": invoice,
        "payment": payment,
        "cnt": cnt,
        "status": status,
        "paid": paid,
        "phone": phone,
        "service_id": serviceId,
        "get_user_id": getUserId,
        "print_user_id": printUserId,
        "create_at": createAt.toJson(),
        "update_at": updateAt.toJson(),
        "id": id,
      };
}

class AteAt {
  dynamic expression;
  List<dynamic> params;

  AteAt({
     this.expression,
    required this.params,
  });

  factory AteAt.fromJson(Map<String, dynamic> json) => AteAt(
        expression: json["expression"],
        params: List<dynamic>.from(json["params"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "expression": expression,
        "params": List<dynamic>.from(params.map((x) => x)),
      };
}
