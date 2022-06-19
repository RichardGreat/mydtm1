class ModelDtmNews {
  ModelDtmNews({
  required  this.id,
  required  this.title,
  required  this.imageUrl,
  required  this.summary,
  required  this.views,
  required  this.createdDate,
  required  this.updateDate,
  });

  dynamic id;
  dynamic title;
  dynamic imageUrl;
  dynamic summary;
  dynamic views;
  dynamic createdDate;
  dynamic updateDate;

  factory ModelDtmNews.fromJson(Map<String, dynamic> json) => ModelDtmNews(
    id: json["id"],
    title: json["title"],
    imageUrl: json["image_url"],
    summary: json["summary"],
    views: json["views"],
    createdDate: json["created_date"],
    updateDate:json["update_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image_url": imageUrl,
    "summary": summary,
    "views": views,
    "created_date": createdDate,
    "update_date": updateDate,
  };
}