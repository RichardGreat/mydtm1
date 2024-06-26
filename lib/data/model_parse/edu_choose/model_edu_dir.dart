class ListModelEduDir {
  String id;
  String emode;
  String emodeName;
  String nameTitle;
  String titleId;
  String nameEdu;
  String eduId;
  String dirName;
  String dirId;
  String fLangId;

  ListModelEduDir(
      {required this.id,
      required this.nameTitle,
      required this.emode,
      required this.emodeName,
      required this.titleId,
      required this.nameEdu,
      required this.eduId,
      required this.dirName,
      required this.dirId,
      required this.fLangId

      });

  factory ListModelEduDir.fromJson(Map<String, dynamic> json) =>
      ListModelEduDir(

          id:json["id"],
          nameTitle:json["name_title"],
          emode:json["emode"],
          emodeName:json["emode_name"],
          titleId:json["title_id"],
          nameEdu:json["name_edu"],
          eduId:json["edu_id"],
          dirName:json["dir_name"],
          dirId:json["dir_id"],
          fLangId:json["flang_id"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id":id,
        "name_title":nameTitle,
        "emode":emode,
        "emode_name":emodeName,
        "title_id":titleId,
        "name_edu":nameEdu,
        "edu_id":eduId,
        "dir_name":dirName,
        "dir_id":dirId,
        "flang_id":fLangId
       };
}
