class ModeCheckUserPerevod {
  ModeCheckUserPerevod({
    required this.person,
    required this.personAddress,
    required this.personGeneralEdu,
    required this.oldEdu,
    required this.abitur,
  });

  bool person;
  bool personAddress;
  bool personGeneralEdu;
  bool oldEdu;
  bool abitur;

  factory ModeCheckUserPerevod.fromJson(Map<String, dynamic> json) =>
      ModeCheckUserPerevod(
        person: json["person"],
        personAddress: json["personAddress"],
        personGeneralEdu: json["personGeneralEdu"],
        oldEdu: json["oldEdu"],
        abitur: json["abitur"],
      );

  Map<String, dynamic> toJson() => {
        "person": person,
        "personAddress": personAddress,
        "personGeneralEdu": personGeneralEdu,
        "oldEdu": oldEdu,
        "abitur": abitur,
      };
}
