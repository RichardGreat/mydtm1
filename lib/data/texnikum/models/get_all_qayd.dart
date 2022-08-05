class ModelQaydVaraqaTexnikum {
  ModelQaydVaraqaTexnikum({
   required this.status,
   required this.abitur,
   required this.imtiyoz,
  });

  int status;
  Abitur abitur;
  List<Imtiyoz> imtiyoz;

  factory ModelQaydVaraqaTexnikum.fromJson(Map<String, dynamic> json) => ModelQaydVaraqaTexnikum(
    status: json["status"],
    abitur: Abitur.fromJson(json["abitur"]),
    imtiyoz: List<Imtiyoz>.from(json["imtiyoz"].map((x) => Imtiyoz.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "abitur": abitur.toJson(),
    "imtiyoz": List<dynamic>.from(imtiyoz.map((x) => x.toJson())),
  };
}

class Abitur {
  Abitur({
  required  this.id,
  required  this.imie,
  required  this.createAt,
  required  this.updateAt,
  required  this.status,
  required  this.directionId,
  required  this.emodeId,
  required  this.langId,
  required  this.eduId,
  required  this.flang,
  required  this.apiId,
  required  this.psId,
  required  this.pstype,
  required  this.lname,
  required  this.fname,
  required  this.mname,
  required  this.psser,
  required  this.psnum,
  required  this.bdate,
  required  this.talmTili,
  required  this.talimShakli,
  required  this.sex,
  required  this.science,
  required  this.mvdirEdu,
  required  this.educ,
  required  this.flangName,
  required  this.flangCertName,
  required  this.statusName,
  required  this.flangLevelName,
  required  this.serNum,
  required  this.givenDate,
  required  this.file,
  });

  dynamic id;
  dynamic imie;
  dynamic createAt;
  dynamic updateAt;
  dynamic status;
  dynamic directionId;
  dynamic emodeId;
  dynamic langId;
  dynamic eduId;
  dynamic flang;
  dynamic apiId;
  dynamic psId;
  dynamic pstype;
  dynamic lname;
  dynamic fname;
  dynamic mname;
  dynamic psser;
  dynamic psnum;
  dynamic bdate;
  dynamic talmTili;
  dynamic talimShakli;
  dynamic sex;
  dynamic science;
  dynamic mvdirEdu;
  dynamic educ;
  dynamic flangName;
  dynamic flangCertName;
  dynamic statusName;
  dynamic flangLevelName;
  dynamic serNum;
  dynamic givenDate;
  dynamic file;

  factory Abitur.fromJson(Map<String, dynamic> json) => Abitur(
    id: json["id"],
    imie: json["imie"],
    createAt:json["create_at"],
    updateAt: json["update_at"],
    status: json["status"],
    directionId: json["direction_id"],
    emodeId: json["emode_id"],
    langId: json["lang_id"],
    eduId: json["edu_id"],
    flang: json["flang"],
    apiId: json["api_id"],
    psId: json["ps_id"],
    pstype: json["pstype"],
    lname: json["lname"],
    fname: json["fname"],
    mname: json["mname"],
    psser: json["psser"],
    psnum: json["psnum"],
    bdate:json["bdate"],
    talmTili: json["talm_tili"],
    talimShakli: json["talim_shakli"],
    sex: json["sex"],
    science: json["science"],
    mvdirEdu: json["mvdir_edu"],
    educ: json["educ"],
    flangName: json["flang_name"],
    flangCertName: json["flang_cert_name"],
    statusName: json["status_name"],
    flangLevelName: json["flang_level_name"],
    serNum: json["ser_num"],
    givenDate: DateTime.parse(json["given_date"]),
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imie": imie,
    "create_at": createAt,
    "update_at": updateAt,
    "status": status,
    "direction_id": directionId,
    "emode_id": emodeId,
    "lang_id": langId,
    "edu_id": eduId,
    "flang": flang,
    "api_id": apiId,
    "ps_id": psId,
    "pstype": pstype,
    "lname": lname,
    "fname": fname,
    "mname": mname,
    "psser": psser,
    "psnum": psnum,
    "bdate": bdate,
    "talm_tili": talmTili,
    "talim_shakli": talimShakli,
    "sex": sex,
    "science": science,
    "mvdir_edu": mvdirEdu,
    "educ": educ,
    "flang_name": flangName,
    "flang_cert_name": flangCertName,
    "status_name": statusName,
    "flang_level_name": flangLevelName,
    "ser_num": serNum,
    "given_date": givenDate,
    "file": file,
  };
}

class Imtiyoz {
  Imtiyoz({
 required  this.id,
 required  this.imie,
 required  this.ser,
 required  this.num,
 required  this.typeId,
 required  this.createAt,
 required  this.updateAt,
 required  this.img,
 required  this.sdate,
 required  this.status,
 required  this.api,
  });

  int id;
  int imie;
  String ser;
  int num;
  int typeId;
  DateTime createAt;
  DateTime updateAt;
  String img;
  DateTime sdate;
  int status;
  int api;

  factory Imtiyoz.fromJson(Map<String, dynamic> json) => Imtiyoz(
    id: json["id"],
    imie: json["imie"],
    ser: json["ser"],
    num: json["num"],
    typeId: json["type_id"],
    createAt: DateTime.parse(json["create_at"]),
    updateAt: DateTime.parse(json["update_at"]),
    img: json["img"],
    sdate: DateTime.parse(json["sdate"]),
    status: json["status"],
    api: json["api"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imie": imie,
    "ser": ser,
    "num": num,
    "type_id": typeId,
    "create_at": createAt.toIso8601String(),
    "update_at": updateAt.toIso8601String(),
    "img": img,
    "sdate": "${sdate.year.toString().padLeft(4, '0')}-${sdate.month.toString().padLeft(2, '0')}-${sdate.day.toString().padLeft(2, '0')}",
    "status": status,
    "api": api,
  };
}
