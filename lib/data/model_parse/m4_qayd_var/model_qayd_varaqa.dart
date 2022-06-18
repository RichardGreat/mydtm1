class ModelArizaQadVaraqa {
  ModelArizaQadVaraqa({
  required  this.status,
  required  this.data,
  });

  dynamic status;
  DataArizaQadVaraqa data;

  factory ModelArizaQadVaraqa.fromJson(Map<String, dynamic> json) => ModelArizaQadVaraqa(
    status: json["status"],
    data: DataArizaQadVaraqa.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataArizaQadVaraqa {
  DataArizaQadVaraqa({
  required  this.model,
  required  this.person,
  required  this.address,
  required  this.education,
  required  this.dir,
  required  this.plans,
  required  this.xarbiy,
  required  this.certNations,
  });

  Model model;
  Person person;
  Address address;
  Education education;
  Dir dir;
  List<Plan> plans;
  List<Xarbiy> xarbiy;
  List<CertNation> certNations;

  factory DataArizaQadVaraqa.fromJson(Map<String, dynamic> json) => DataArizaQadVaraqa(
    model: Model.fromJson(json["model"]),
    person: Person.fromJson(json["person"]),
    address: Address.fromJson(json["address"]),
    education: Education.fromJson(json["education"]),
    dir: Dir.fromJson(json["dir"]),
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
    xarbiy: List<Xarbiy>.from(json["xarbiy"].map((x) => Xarbiy.fromJson(x))),
    certNations: List<CertNation>.from(json["cert_nations"].map((x) => CertNation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "model": model.toJson(),
    "person": person.toJson(),
    "address": address.toJson(),
    "education": education.toJson(),
    "dir": dir.toJson(),
    "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
    "xarbiy": List<dynamic>.from(xarbiy.map((x) => x.toJson())),
    "cert_nations": List<dynamic>.from(certNations.map((x) => x.toJson())),
  };
}

class Address {
  Address({
   required this.regionName,
   required this.districtName,
   required this.address,
  });

  dynamic regionName;
  dynamic districtName;
  dynamic address;

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
  CertNation({
  required  this.isCheck,
  required  this.id,
  required  this.ball,
  required  this.percent,
  required  this.startAt,
  required  this.sName,
  });

 dynamic isCheck;
 dynamic id;
 dynamic ball;
 dynamic percent;
 dynamic startAt;
 dynamic sName;

  factory CertNation.fromJson(Map<String, dynamic> json) => CertNation(
    isCheck: json["is_check"],
    id: json["id"],
    ball: json["ball"],
    percent: json["percent"],
    startAt: json["start_at"],
    sName: json["s_name"],
  );

  Map<String, dynamic> toJson() => {
    "is_check": isCheck,
    "id": id,
    "ball": ball,
    "percent": percent,
    "start_at": startAt,
    "s_name": sName,
  };
}

class Dir {
  Dir({
  required this.b1,
  required this.b2,
  });

 dynamic b1;
 dynamic b2;

  factory Dir.fromJson(Map<String, dynamic> json) => Dir(
    b1: json["b1"],
    b2: json["b2"],
  );

  Map<String, dynamic> toJson() => {
    "b1": b1,
    "b2": b2,
  };
}

class Education {
  Education({
 required  this.countryName,
 required  this.regionName,
 required  this.districtName,
 required  this.generalEduListName,
 required  this.gEduTypeName,
 required  this.eduName,
 required  this.graduatedYear,
 required  this.docSerNum,
 required  this.countryId,
  });

 dynamic countryName;
 dynamic regionName;
 dynamic districtName;
 dynamic generalEduListName;
 dynamic gEduTypeName;
 dynamic eduName;
 dynamic graduatedYear;
 dynamic docSerNum;
 dynamic countryId;

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

class Model {
  Model({
  required  this.id,
  required  this.imie,
  required  this.testRegionId,
  required  this.flangId,
  required  this.testGraph,
  required  this.logId,
  required  this.langId,
  required  this.dirId,
  required  this.appId,
  required  this.isGrand,
  required  this.isMaqsad,
  required  this.createdAt,
  required  this.updatedAt,
  required  this.invoice,
  required  this.hash,
  required  this.status,
  required  this.serial,
  required  this.pay,
  required  this.fee,
  required  this.balance,
  required  this.tregion,
  required  this.flangName,
  required  this.eduLangName,
  });

 dynamic id;
 dynamic imie;
 dynamic testRegionId;
 dynamic flangId;
 dynamic testGraph;
 dynamic logId;
 dynamic langId;
 dynamic dirId;
 dynamic appId;
 dynamic isGrand;
 dynamic isMaqsad;
 dynamic createdAt;
 dynamic updatedAt;
 dynamic invoice;
 dynamic hash;
 dynamic status;
 dynamic serial;
 dynamic pay;
 dynamic fee;
 dynamic balance;
 dynamic tregion;
 dynamic flangName;
 dynamic eduLangName;

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
    createdAt:json["created_at"],
    updatedAt:json["updated_at"],
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
    "created_at": createdAt,
    "updated_at": updatedAt,
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
  Person({
  required  this.id,
  required  this.psser,
  required  this.psnum,
  required  this.imie,
  required  this.lname,
  required  this.fname,
  required  this.mname,
  required  this.bdate,
  required  this.sex,
  required  this.data,
  });

 dynamic id;
 dynamic psser;
 dynamic psnum;
 dynamic imie;
 dynamic lname;
 dynamic fname;
 dynamic mname;
 dynamic bdate;
 dynamic sex;
 dynamic data;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    psser: json["psser"],
    psnum: json["psnum"],
    imie: json["imie"],
    lname: json["lname"],
    fname: json["fname"],
    mname: json["mname"],
    bdate:json["bdate"],
    sex: json["sex"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "psser": psser,
    "psnum": psnum,
    "imie": imie,
    "lname": lname,
    "fname": fname,
    "mname": mname,
    "bdate": bdate,
    "sex": sex,
    "data": data,
  };
}

class Plan {
  Plan({
  required  this.id,
  required  this.orderId,
  required  this.emodeName,
  required  this.eduName,
  required  this.dirName,
  });

 dynamic id;
 dynamic orderId;
 dynamic emodeName;
 dynamic eduName;
 dynamic dirName;

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

class Xarbiy {
  Xarbiy({
 required   this.eduName,
 required   this.dirName,
  });

  dynamic eduName;
  dynamic dirName;

  factory Xarbiy.fromJson(Map<String, dynamic> json) => Xarbiy(
    eduName: json["edu_name"],
    dirName: json["dir_name"],
  );

  Map<String, dynamic> toJson() => {
    "edu_name": eduName,
    "dir_name": dirName,
  };
}
