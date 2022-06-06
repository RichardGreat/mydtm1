class ModelCheckUserInfo {
  ModelCheckUserInfo({
  required   this.person,
  required  this.personAddress,
  required  this.personGeneralEdu,
  required  this.certificate,
  required  this.imtiyoz,
  required  this.bakalavr,
  });

  bool person;
  bool personAddress;
  bool personGeneralEdu;
  bool certificate;
  bool imtiyoz;
  bool bakalavr;

  factory ModelCheckUserInfo.fromJson(Map<String, dynamic> json) => ModelCheckUserInfo(
    person: json["person"],
    personAddress: json["personAddress"],
    personGeneralEdu: json["personGeneralEdu"],
    certificate: json["certificate"],
    imtiyoz: json["imtiyoz"],
    bakalavr: json["bakalavr"],
  );

  Map<String, dynamic> toJson() => {
    "person": person,
    "personAddress": personAddress,
    "personGeneralEdu": personGeneralEdu,
    "certificate": certificate,
    "imtiyoz": imtiyoz,
    "bakalavr": bakalavr,
  };
}
