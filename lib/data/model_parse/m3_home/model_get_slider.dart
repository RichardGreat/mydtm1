class ModelGetSlider {
  dynamic id;
  dynamic title;
  dynamic imageUrl;
  dynamic link;
  dynamic description;
  dynamic ves;
  dynamic status;

  ModelGetSlider({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.link,
    required this.description,
    required this.ves,
    required this.status,
  });

  factory ModelGetSlider.fromJson(Map<String, dynamic> json) => ModelGetSlider(
    id: json["id"]??"1",
    title: json["title"]??"",
    imageUrl: json["image_url"]??"",
    link: json["link"]??"",
    description: json["description"]??"",
    ves: json["ves"]??"",
    status: json["status"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image_url": imageUrl,
    "link": link,
    "description": description,
    "ves": ves,
    "status": status,
  };
}
