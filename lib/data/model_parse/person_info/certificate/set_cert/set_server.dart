class ModelSetServerCertificate {
  ModelSetServerCertificate({
 required   this.status,
 required  this.masseage,
  });

  int status;
  MasseageSetServerCertificate masseage;

  factory ModelSetServerCertificate.fromJson(Map<String, dynamic> json) => ModelSetServerCertificate(
    status: json["status"],
    masseage: MasseageSetServerCertificate.fromJson(json["masseage"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "masseage": masseage.toJson(),
  };
}

class MasseageSetServerCertificate {
  MasseageSetServerCertificate({
   required this.serNum,
   required this.flangLevelId,
   required this.givenDate,
   required this.status,
   required this.userId,
   required this.raiting,
   required this.imie,
   required this.image,
   required this.id,
  });

 dynamic serNum;
 dynamic flangLevelId;
 dynamic givenDate;
 dynamic status;
 dynamic userId;
 dynamic raiting;
 dynamic imie;
 dynamic image;
 dynamic id;

  factory MasseageSetServerCertificate.fromJson(Map<String, dynamic> json) => MasseageSetServerCertificate(
    serNum: json["ser_num"],
    flangLevelId: json["flang_level_id"],
    givenDate:json["given_date"],
    status: json["status"],
    userId: json["user_id"],
    raiting: json["raiting"],
    imie: json["imie"],
    image: json["image"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "ser_num": serNum,
    "flang_level_id": flangLevelId,
    "given_date": givenDate,
    "status": status,
    "user_id": userId,
    "raiting": raiting,
    "imie": imie,
    "image": image,
    "id": id,
  };
}
