class ModelGetImieInfo {
  ModelGetImieInfo({
   required this.status,
   required this.data,
  });

  int status;
  DataGetImieInfo data;

  factory ModelGetImieInfo.fromJson(Map<String, dynamic> json) => ModelGetImieInfo(
    status: json["status"],
    data: DataGetImieInfo.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}
// {"status":1,"data":{"id":2318740,"psser":"AD","psnum":"4649342","imie":31009955310031,"lname":"TOJIYEV","fname":"SOBIR","mname":"BAHODIR O‘G‘LI","bdate":"1995-09-10","sex":true,"nation_id":1,"image"

class DataGetImieInfo {
  DataGetImieInfo({
   this.id,
   this.psser,
   this.psnum,
   this.imie,
   this.lname,
   this.fname,
   this.mname,
   this.bdate,
   this.sex,
   this.nationId,
   this.image,
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

  factory DataGetImieInfo.fromJson(Map<String, dynamic> json) => DataGetImieInfo(
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
