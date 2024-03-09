class ModelCheckNewsNotification {
  dynamic id;
  dynamic title;
  dynamic summary;
  dynamic updateDate;

  ModelCheckNewsNotification({
    this.id,
    this.title,
    this.summary,
    this.updateDate,
  });

  factory ModelCheckNewsNotification.fromJson(Map<String, dynamic> json) => ModelCheckNewsNotification(
    id: json["id"].toString(),
    title: json["title"].toString(),
    summary: json["summary"].toString(),
    updateDate: json["update_date"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "summary": summary,
    "update_date": updateDate,
  };
}
