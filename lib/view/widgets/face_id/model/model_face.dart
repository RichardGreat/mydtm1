
class ModelFace {
  bool status;
  String sname;
  String fname;
  String mname;

  ModelFace({
    required this.status,
    required this.sname,
    required this.fname,
    required this.mname,
  });

  factory ModelFace.fromJson(Map<String, dynamic> json) => ModelFace(
    status: json["status"],
    sname: json["sname"],
    fname: json["fname"],
    mname: json["mname"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "sname": sname,
    "fname": fname,
    "mname": mname,
  };
}


class ModelFaceNotRec {
  dynamic status;

  ModelFaceNotRec({
    required this.status,
  });

  factory ModelFaceNotRec.fromJson(Map<String, dynamic> json) => ModelFaceNotRec(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
