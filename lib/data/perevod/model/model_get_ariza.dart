class ModelGetArizaPerevod {
  int status;
  Abitur abitur;

  ModelGetArizaPerevod({
    required this.status,
    required this.abitur,
  });

  factory ModelGetArizaPerevod.fromJson(Map<String, dynamic> json) => ModelGetArizaPerevod(
    status: json["status"],
    abitur: Abitur.fromJson(json["abitur"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "abitur": abitur.toJson(),
  };
}

class Abitur {
  dynamic id;
  dynamic imie;
  dynamic directionId;
  dynamic flang;
  dynamic testRegion;
  dynamic comment;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic checkStatus;
  dynamic invoice;
  dynamic pay;
  dynamic sum;
  dynamic comments;
  dynamic userId;
  dynamic tt;
  dynamic status;
  dynamic hash;
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
  dynamic gtalimShakli;
  dynamic sex;
  dynamic testR;
  dynamic regionName;
  dynamic mvdirName;
  dynamic eduName;
  dynamic end;
  dynamic science;
  dynamic dirId;
  dynamic mvdirEdu;
  dynamic educ;

  Abitur({
    required this.id,
    required this.imie,
    required this.directionId,
    required this.flang,
    required this.testRegion,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.checkStatus,
    required this.invoice,
    required this.pay,
    required this.sum,
    required this.comments,
    required this.userId,
    required this.tt,
    required this.status,
    this.hash,
    required this.psId,
    required this.pstype,
    required this.lname,
    required this.fname,
    required this.mname,
    required this.psser,
    required this.psnum,
    required this.bdate,
    required this.talmTili,
    required this.talimShakli,
    required this.gtalimShakli,
    required this.sex,
    required this.testR,
    required this.regionName,
    required this.mvdirName,
    required this.eduName,
    required this.end,
    required this.science,
    required this.dirId,
    required this.mvdirEdu,
    required this.educ,
  });

  factory Abitur.fromJson(Map<String, dynamic> json) => Abitur(
    id: json["id"],
    imie: json["imie"],
    directionId: json["direction_id"],
    flang: json["flang"],
    testRegion: json["test_region"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_At"]),
    checkStatus:  json["check_status"],
    invoice: json["invoice"],
    pay: json["pay"],
    sum: json["sum"],
    comments: json["comments"],
    userId: json["user_id"],
    tt: json["tt"],
    status: json["status"],
    hash: json["hash"],
    psId: json["ps_id"],
    pstype: json["pstype"],
    lname: json["lname"],
    fname: json["fname"],
    mname: json["mname"],
    psser: json["psser"],
    psnum: json["psnum"],
    bdate: DateTime.parse(json["bdate"]),
    talmTili: json["talm_tili"],
    talimShakli: json["talim_shakli"],
    gtalimShakli: json["gtalim_shakli"],
    sex: json["sex"],
    testR: json["test_r"],
    regionName: json["region_name"],
    mvdirName: json["mvdir_name"],
    eduName: json["edu_name"],
    end: json["end"],
    science: json["science"],
    dirId: json["dir_id"],
    mvdirEdu: json["mvdir_edu"],
    educ: json["educ"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imie": imie,
    "direction_id": directionId,
    "flang": flang,
    "test_region": testRegion,
    "comment": comment,
    "created_at": createdAt.toIso8601String(),
    "updated_At": updatedAt.toIso8601String(),
    "check_status": checkStatus,
    "invoice": invoice,
    "pay": pay,
    "sum": sum,
    "comments": comments,
    "user_id": userId,
    "tt": tt,
    "status": status,
    "hash": hash,
    "ps_id": psId,
    "pstype": pstype,
    "lname": lname,
    "fname": fname,
    "mname": mname,
    "psser": psser,
    "psnum": psnum,
    "bdate": "${bdate.year.toString().padLeft(4, '0')}-${bdate.month.toString().padLeft(2, '0')}-${bdate.day.toString().padLeft(2, '0')}",
    "talm_tili": talmTili,
    "talim_shakli": talimShakli,
    "gtalim_shakli": gtalimShakli,
    "sex": sex,
    "test_r": testR,
    "region_name": regionName,
    "mvdir_name": mvdirName,
    "edu_name": eduName,
    "end": end,
    "science": science,
    "dir_id": dirId,
    "mvdir_edu": mvdirEdu,
    "educ": educ,
  };
}
