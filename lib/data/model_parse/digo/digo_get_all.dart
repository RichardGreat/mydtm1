import 'package:hive/hive.dart';

class ModelDigoAll {
  dynamic status;
  Data data;

  ModelDigoAll({
     this.status,
    required this.data,
  });

  factory ModelDigoAll.fromJson(Map<String, dynamic> json) => ModelDigoAll(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  List<Datum> data;
  dynamic links;
  dynamic meta;

  Data({
    required this.data,
     this.links,
     this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: json["_links"],
    meta: json["_meta"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "_links": links.toJson(),
    "_meta": meta.toJson(),
  };
}

class Datum {
  dynamic id;
  dynamic imie;
  dynamic invoice;
  dynamic cnt;
  dynamic createAt;
  dynamic regionName;
  dynamic pay;
  List<Order> order;

  Datum({
    required this.id,
    this.imie,
    this.invoice,
    this.cnt,
    this.createAt,
    this.regionName,
    this.pay,
    required this.order,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    imie: json["imie"],
    invoice: json["invoice"],
    cnt: json["cnt"],
    createAt: json["create_at"],
    regionName: json["region_name"],
    pay: json["pay"],
    order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imie": imie,
    "invoice": invoice,
    "cnt": cnt,
    "create_at": createAt.toIso8601String(),
    "region_name": regionName,
    "pay": pay,
    "order": List<dynamic>.from(order.map((x) => x.toJson())),
  };
}

class Order {
  dynamic id;
  dynamic orderId;
  dynamic cnt;
  dynamic complexId;
  dynamic createAt;
  dynamic updateAt;
  dynamic booknum;
  Dir dir;

  Order({
    this.id,
    this.orderId,
    this.cnt,
    this.complexId,
    this.createAt,
    this.updateAt,
    this.booknum,
    required this.dir,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    orderId: json["order_id"],
    cnt: json["cnt"],
    complexId: json["complex_id"],
    createAt: DateTime.parse(json["create_at"]),
    updateAt: json["update_at"],
    booknum: json["booknum"],
    dir: Dir.fromJson(json["dir"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "cnt": cnt,
    "complex_id": complexId,
    "create_at": createAt.toIso8601String(),
    "update_at": updateAt,
    "booknum": booknum,
    "dir": dir.toJson(),
  };
}

class Dir {
  dynamic code;
  Lang lang;
  dynamic langName;
  dynamic fan1;
  dynamic fan2;
  dynamic bal1;
  dynamic bal2;
  dynamic flang;
  dynamic tipId;
  dynamic status;
  dynamic sc1;
  dynamic sc2;
  dynamic orderId;
  dynamic id;
  dynamic newTip;
  Fan fanOne;
  dynamic fanTwo;

  Dir({
     this.code,
    required this.lang,
     this.langName,
     this.fan1,
     this.fan2,
     this.bal1,
     this.bal2,
     this.flang,
     this.tipId,
     this.status,
     this.sc1,
     this.sc2,
     this.orderId,
     this.id,
     this.newTip,
    required this.fanOne,
    required this.fanTwo,
  });

  factory Dir.fromJson(Map<String, dynamic> json) => Dir(
    code: json["code"],
    lang: Lang.fromJson(json["lang"]),
    langName: json["lang_name"],
    fan1: json["fan1"],
    fan2: json["fan2"],
    bal1: json["bal1"],
    bal2: json["bal2"],
    flang: json["flang"],
    tipId: json["tip_id"],
    status: json["status"],
    sc1: json["sc1"],
    sc2: json["sc2"],
    orderId: json["order_id"],
    id: json["id"],
    newTip: json["new_tip"],
    fanOne: Fan.fromJson(json["fanOne"]),
    fanTwo: Fan.fromJson(json["fanTwo"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "lang": lang.toJson(),
    "lang_name": langName,
    "fan1": fan1,
    "fan2": fan2,
    "bal1": bal1,
    "bal2": bal2,
    "flang": flang,
    "tip_id": tipId,
    "status": status,
    "sc1": sc1,
    "sc2": sc2,
    "order_id": orderId,
    "id": id,
    "new_tip": newTip,
    "fanOne": fanOne.toJson(),
    "fanTwo": fanTwo.toJson(),
  };
}

class Fan {
   dynamic id;
   String name;
   dynamic createAt;
   dynamic updateAt;
   dynamic nameRu;
   dynamic nameQq;
   dynamic typeId;
   dynamic  orderId;
   dynamic  nameCr;
   var box = Hive.box("online");
  Fan({
    this.id,
  required  this.name,
    this.createAt,
    this.updateAt,
    this.nameRu,
    this.nameQq,
    this.typeId,
    this.orderId,
    this.nameCr,
  });

  factory Fan.fromJson(Map<String, dynamic> json) => Fan(
    id: json["id"],
    name: json["name"],
    createAt:json["create_at"],
    updateAt: json["update_at"],
    nameRu: json["name_ru"],
    nameQq: json["name_qq"],
    typeId: json["type_id"],
    orderId: json["order_id"],
    nameCr: json["name_cr"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "create_at": createAt.toIso8601String(),
    "update_at": updateAt,
    "name_ru": nameRu,
    "name_qq": nameQq,
    "type_id": typeId,
    "order_id": orderId,
    "name_cr": nameCr,
  };
}

class Lang {
  int id;
  String name;
  String nameRu;
  String nameQq;
  DateTime createAt;
  DateTime updateAt;
  bool status;
  String nameUz;
  String asSubject;

  Lang({
    required this.id,
    required this.name,
    required this.nameRu,
    required this.nameQq,
    required this.createAt,
    required this.updateAt,
    required this.status,
    required this.nameUz,
    required this.asSubject,
  });

  factory Lang.fromJson(Map<String, dynamic> json) => Lang(
    id: json["id"],
    name: json["name"],
    nameRu: json["name_ru"],
    nameQq: json["name_qq"],
    createAt: DateTime.parse(json["create_at"]),
    updateAt: DateTime.parse(json["update_at"]),
    status: json["status"],
    nameUz: json["name_uz"],
    asSubject: json["as_subject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_ru": nameRu,
    "name_qq": nameQq,
    "create_at": createAt.toIso8601String(),
    "update_at": updateAt.toIso8601String(),
    "status": status,
    "name_uz": nameUz,
    "as_subject": asSubject,
  };
}
