class ModelGetImieInfo {
  ModelGetImieInfo({
    required this.status,
    required this.data,
  });

  int status;
  DataGetImieInfo data;

  factory ModelGetImieInfo.fromJson(Map<String, dynamic> json) =>
      ModelGetImieInfo(
        status: json["status"],
        data: DataGetImieInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class DataGetImieInfo {
  DataGetImieInfo({
    required this.id,
    required this.psser,
    required this.psnum,
    required this.imie,
    required this.lname,
    required this.fname,
    required this.mname,
    required this.bdate,
    required this.sex,
    required this.nationId,
    required this.image,
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
  dynamic nationId;
  dynamic image;

  factory DataGetImieInfo.fromJson(Map<String, dynamic> json) =>
      DataGetImieInfo(
        id: json["id"],
        psser: json["psser"],
        psnum: json["psnum"],
        imie: json["imie"],
        lname: json["lname"],
        fname: json["fname"],
        mname: json["mname"],
        bdate: json["bdate"],
        sex: json["sex"],
        nationId: json["nation_id"],
        image: json["image"],
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
        "nation_id": nationId,
        "image": image,
      };
}
