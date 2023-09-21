class ModelSubjectGet {
  dynamic subjectId;
  dynamic subjectName;
  dynamic subjectImgLink;
  dynamic pdfLink;

  ModelSubjectGet({
    this.subjectId,
    this.subjectName,
    this.subjectImgLink,
    this.pdfLink,
  });

  factory ModelSubjectGet.fromJson(Map<String, dynamic> json) => ModelSubjectGet(
    subjectId: json["subject_id"]??"",
    subjectName: json["subject_name"]??"",
    subjectImgLink: json["subject_img_link"]??"",
    pdfLink: json["pdf_link"]??"",
  );

  Map<String, dynamic> toJson() => {
    "subject_id": subjectId,
    "subject_name": subjectName,
    "subject_img_link": subjectImgLink,
    "pdf_link": pdfLink,
  };
}
