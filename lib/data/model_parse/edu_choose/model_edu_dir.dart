class ListModelEduDir {
  String id;
  String nameTitle;
  String titleId;
  String nameEdu;
  String eduId;
  String dirName;
  String dirId;

  ListModelEduDir(
      {required this.id,
      required this.nameTitle,
      required this.titleId,
      required this.nameEdu,
      required this.eduId,
      required this.dirName,
      required this.dirId});

  factory ListModelEduDir.fromJson(Map<String, dynamic> json) =>
      ListModelEduDir(

          id:json["id"],
          nameTitle:json["name_title"],
          titleId:json["title_id"],
          nameEdu:json["name_edu"],
          eduId:json["edu_id"],
          dirName:json["dir_name"],
          dirId:json["dir_id"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id":id,
        "name_title":nameTitle,
        "title_id":titleId,
        "name_edu":nameEdu,
        "edu_id":eduId,
        "dir_name":dirName,
        "dir_id":dirId,
       };
}
