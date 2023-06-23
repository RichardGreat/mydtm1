class ModelArizaQadVaraqa {
  int status;
  DataArizaQadVaraqa dataArizaQadVaraqa;

  ModelArizaQadVaraqa({
    required this.status,
    required this.dataArizaQadVaraqa,
  });

  factory ModelArizaQadVaraqa.fromJson(Map<String, dynamic> json) => ModelArizaQadVaraqa(
    status: json["status"],
    dataArizaQadVaraqa: DataArizaQadVaraqa.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": dataArizaQadVaraqa.toJson(),
  };
}

class DataArizaQadVaraqa {
  Model model;
  Person person;
  Address address;
  Education education;
  // List<Plan> plans;
  // Dir dir;
  // List<dynamic> xarbiy;
  // List<CertNation> certNations;
  // List<ImtiyozList> imtiyozList;
  // List<FlangSertList> flangSertList;
  // InvalidList invalidList;

  DataArizaQadVaraqa({
    required this.model,
    required this.person,
    required this.address,
    required this.education,
    // required this.plans,
    // required this.dir,
    // required this.xarbiy,
    // required this.certNations,
    // required this.imtiyozList,
    // required this.flangSertList,
    // required this.invalidList,
  });

  factory DataArizaQadVaraqa.fromJson(Map<String, dynamic> json) => DataArizaQadVaraqa(
    model: Model.fromJson(json["model"]),
    person: Person.fromJson(json["person"]),
    address: Address.fromJson(json["address"]),
    education: Education.fromJson(json["education"]),
    // plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
    // dir: Dir.fromJson(json["dir"]),
    // xarbiy: List<dynamic>.from(json["xarbiy"].map((x) => x)),
    // certNations: List<CertNation>.from(json["cert_nations"].map((x) => CertNation.fromJson(x))),
    // imtiyozList: List<ImtiyozList>.from(json["imtiyoz_list"].map((x) => ImtiyozList.fromJson(x))),
    // flangSertList: List<FlangSertList>.from(json["flang_sert_list"].map((x) => FlangSertList.fromJson(x))),
    // invalidList: InvalidList.fromJson(json["invalid_list"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model.toJson(),
    "person": person.toJson(),
    "address": address.toJson(),
    "education": education.toJson(),
    // "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
    // "dir": dir.toJson(),
    // "xarbiy": List<dynamic>.from(xarbiy.map((x) => x)),
    // "cert_nations": List<dynamic>.from(certNations.map((x) => x.toJson())),
    // "imtiyoz_list": List<dynamic>.from(imtiyozList.map((x) => x.toJson())),
    // "flang_sert_list": List<dynamic>.from(flangSertList.map((x) => x.toJson())),
    // "invalid_list": invalidList.toJson(),
  };
}

class Address {
  String regionName;
  String districtName;
  String address;

  Address({
    required this.regionName,
    required this.districtName,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    regionName: json["region_name"],
    districtName: json["district_name"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "region_name": regionName,
    "district_name": districtName,
    "address": address,
  };
}

class CertNation {
  int isCheck;
  int id;
  String ball;
  String percent;
  DateTime startAt;
  String sName;

  CertNation({
    required this.isCheck,
    required this.id,
    required this.ball,
    required this.percent,
    required this.startAt,
    required this.sName,
  });

  factory CertNation.fromJson(Map<String, dynamic> json) => CertNation(
    isCheck: json["is_check"],
    id: json["id"],
    ball: json["ball"],
    percent: json["percent"],
    startAt: DateTime.parse(json["start_at"]),
    sName: json["s_name"],
  );

  Map<String, dynamic> toJson() => {
    "is_check": isCheck,
    "id": id,
    "ball": ball,
    "percent": percent,
    "start_at": "${startAt.year.toString().padLeft(4, '0')}-${startAt.month.toString().padLeft(2, '0')}-${startAt.day.toString().padLeft(2, '0')}",
    "s_name": sName,
  };
}

class Dir {
  Main main;
  List<Required> required;

  Dir({
    required this.main,
    required this.required,
  });

  factory Dir.fromJson(Map<String, dynamic> json) => Dir(
    main: Main.fromJson(json["main"]),
    required: List<Required>.from(json["required"].map((x) => Required.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "main": main.toJson(),
    "required": List<dynamic>.from(required.map((x) => x.toJson())),
  };
}

class Main {
  B1 b1;
  B1 b2;

  Main({
    required this.b1,
    required this.b2,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    b1: B1.fromJson(json["b1"]),
    b2: B1.fromJson(json["b2"]),
  );

  Map<String, dynamic> toJson() => {
    "b1": b1.toJson(),
    "b2": b2.toJson(),
  };
}

class B1 {
  String name;
  int count;
  double ball;
  int totalBall;

  B1({
    required this.name,
    required this.count,
    required this.ball,
    required this.totalBall,
  });

  factory B1.fromJson(Map<String, dynamic> json) => B1(
    name: json["name"],
    count: json["count"],
    ball: json["ball"]?.toDouble(),
    totalBall: json["total_ball"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "count": count,
    "ball": ball,
    "total_ball": totalBall,
  };
}

class Required {
  String nameUz;
  String nameRu;
  String nameQq;
  int count;
  double ball;
  int totalBall;

  Required({
    required this.nameUz,
    required this.nameRu,
    required this.nameQq,
    required this.count,
    required this.ball,
    required this.totalBall,
  });

  factory Required.fromJson(Map<String, dynamic> json) => Required(
    nameUz: json["name_uz"],
    nameRu: json["name_ru"],
    nameQq: json["name_qq"],
    count: json["count"],
    ball: json["ball"]?.toDouble(),
    totalBall: json["total_ball"],
  );

  Map<String, dynamic> toJson() => {
    "name_uz": nameUz,
    "name_ru": nameRu,
    "name_qq": nameQq,
    "count": count,
    "ball": ball,
    "total_ball": totalBall,
  };
}

class Education {
  String countryName;
  String regionName;
  String districtName;
  String generalEduListName;
  String gEduTypeName;
  dynamic eduName;
  int graduatedYear;
  String docSerNum;
  int countryId;

  Education({
    required this.countryName,
    required this.regionName,
    required this.districtName,
    required this.generalEduListName,
    required this.gEduTypeName,
    this.eduName,
    required this.graduatedYear,
    required this.docSerNum,
    required this.countryId,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    countryName: json["country_name"],
    regionName: json["region_name"],
    districtName: json["district_name"],
    generalEduListName: json["general_edu_list_name"],
    gEduTypeName: json["g_edu_type_name"],
    eduName: json["edu_name"],
    graduatedYear: json["graduated_year"],
    docSerNum: json["doc_ser_num"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "country_name": countryName,
    "region_name": regionName,
    "district_name": districtName,
    "general_edu_list_name": generalEduListName,
    "g_edu_type_name": gEduTypeName,
    "edu_name": eduName,
    "graduated_year": graduatedYear,
    "doc_ser_num": docSerNum,
    "country_id": countryId,
  };
}

class FlangSertList {
  String serNum;
  String langName;
  String sertType;
  String level;
  String status;
  DateTime givenDate;

  FlangSertList({
    required this.serNum,
    required this.langName,
    required this.sertType,
    required this.level,
    required this.status,
    required this.givenDate,
  });

  factory FlangSertList.fromJson(Map<String, dynamic> json) => FlangSertList(
    serNum: json["ser_num"],
    langName: json["lang_name"],
    sertType: json["sert_type"],
    level: json["level"],
    status: json["status"],
    givenDate: DateTime.parse(json["given_date"]),
  );

  Map<String, dynamic> toJson() => {
    "ser_num": serNum,
    "lang_name": langName,
    "sert_type": sertType,
    "level": level,
    "status": status,
    "given_date": "${givenDate.year.toString().padLeft(4, '0')}-${givenDate.month.toString().padLeft(2, '0')}-${givenDate.day.toString().padLeft(2, '0')}",
  };
}

class ImtiyozList {
  DateTime startDate;
  String ser;
  String num;
  String name;

  ImtiyozList({
    required this.startDate,
    required this.ser,
    required this.num,
    required this.name,
  });

  factory ImtiyozList.fromJson(Map<String, dynamic> json) => ImtiyozList(
    startDate: DateTime.parse(json["start_date"]),
    ser: json["ser"],
    num: json["num"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "ser": ser,
    "num": num,
    "name": name,
  };
}

class InvalidList {
  DateTime startDate;
  DateTime endDate;
  String serNum;
  String typeName;
  String orgName;

  InvalidList({
    required this.startDate,
    required this.endDate,
    required this.serNum,
    required this.typeName,
    required this.orgName,
  });

  factory InvalidList.fromJson(Map<String, dynamic> json) => InvalidList(
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    serNum: json["ser_num"],
    typeName: json["type_name"],
    orgName: json["org_name"],
  );

  Map<String, dynamic> toJson() => {
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "ser_num": serNum,
    "type_name": typeName,
    "org_name": orgName,
  };
}

class Model {
  int id;
  int imie;
  int testRegionId;
  int flangId;
  bool testGraph;
  int logId;
  int langId;
  int dirId;
  int appId;
  bool isGrand;
  bool isMaqsad;
  DateTime createdAt;
  DateTime updatedAt;
  int invoice;
  String hash;
  int status;
  int serial;
  int pay;
  int fee;
  String balance;
  String tregion;
  String flangName;
  String eduLangName;

  Model({
    required this.id,
    required this.imie,
    required this.testRegionId,
    required this.flangId,
    required this.testGraph,
    required this.logId,
    required this.langId,
    required this.dirId,
    required this.appId,
    required this.isGrand,
    required this.isMaqsad,
    required this.createdAt,
    required this.updatedAt,
    required this.invoice,
    required this.hash,
    required this.status,
    required this.serial,
    required this.pay,
    required this.fee,
    required this.balance,
    required this.tregion,
    required this.flangName,
    required this.eduLangName,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"],
    imie: json["imie"],
    testRegionId: json["test_region_id"],
    flangId: json["flang_id"],
    testGraph: json["test_graph"],
    logId: json["log_id"],
    langId: json["lang_id"],
    dirId: json["dir_id"],
    appId: json["app_id"],
    isGrand: json["is_grand"],
    isMaqsad: json["is_maqsad"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    invoice: json["invoice"],
    hash: json["hash"],
    status: json["status"],
    serial: json["serial"],
    pay: json["pay"],
    fee: json["fee"],
    balance: json["balance"],
    tregion: json["tregion"],
    flangName: json["flang_name"],
    eduLangName: json["edu_lang_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imie": imie,
    "test_region_id": testRegionId,
    "flang_id": flangId,
    "test_graph": testGraph,
    "log_id": logId,
    "lang_id": langId,
    "dir_id": dirId,
    "app_id": appId,
    "is_grand": isGrand,
    "is_maqsad": isMaqsad,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "invoice": invoice,
    "hash": hash,
    "status": status,
    "serial": serial,
    "pay": pay,
    "fee": fee,
    "balance": balance,
    "tregion": tregion,
    "flang_name": flangName,
    "edu_lang_name": eduLangName,
  };
}

class Person {
  int id;
  String psser;
  int psnum;
  int imie;
  String lname;
  String fname;
  String mname;
  DateTime bdate;
  bool sex;

  Person({
    required this.id,
    required this.psser,
    required this.psnum,
    required this.imie,
    required this.lname,
    required this.fname,
    required this.mname,
    required this.bdate,
    required this.sex,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    psser: json["psser"],
    psnum: json["psnum"],
    imie: json["imie"],
    lname: json["lname"],
    fname: json["fname"],
    mname: json["mname"],
    bdate: DateTime.parse(json["bdate"]),
    sex: json["sex"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "psser": psser,
    "psnum": psnum,
    "imie": imie,
    "lname": lname,
    "fname": fname,
    "mname": mname,
    "bdate": "${bdate.year.toString().padLeft(4, '0')}-${bdate.month.toString().padLeft(2, '0')}-${bdate.day.toString().padLeft(2, '0')}",
    "sex": sex,
  };
}

class Plan {
  int id;
  int orderId;
  String emodeName;
  String eduName;
  String dirName;

  Plan({
    required this.id,
    required this.orderId,
    required this.emodeName,
    required this.eduName,
    required this.dirName,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    orderId: json["order_id"],
    emodeName: json["emode_name"],
    eduName: json["edu_name"],
    dirName: json["dir_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "emode_name": emodeName,
    "edu_name": eduName,
    "dir_name": dirName,
  };
}
