class ModelServiceList {
  ModelServiceList({
    required this.status,
    required this.data,
  });

  int status;
  List<DataServiceList> data;

  factory ModelServiceList.fromJson(Map<String, dynamic> json) =>
      ModelServiceList(
        status: json["status"],
        data: List<DataServiceList>.from(json["data"].map((x) => DataServiceList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataServiceList {
  DataServiceList({
   required this.id,
   required this.categoryName,
   required this.service,
  });

  int id;
  String categoryName;
  List<ServiceMainList> service;

  factory DataServiceList.fromJson(Map<String, dynamic> json) => DataServiceList(
        id: json["id"],
        categoryName: json["category_name"],
        service:
            List<ServiceMainList>.from(json["service"].map((x) => ServiceMainList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "service": List<dynamic>.from(service.map((x) => x.toJson())),
      };
}

class ServiceMainList {
  ServiceMainList({
   required this.id,
   required this.serviceName,
   required this.serviceText,
   required this.status,
   required this.link,
   required this.icon,
   required this.catId,
   required this.cod,
   required this.sortId,
  });

  int id;
  String serviceName;
  String serviceText;
  bool status;
  String link;
  String icon;
  int catId;
  int cod;
  int sortId;

  factory ServiceMainList.fromJson(Map<String, dynamic> json) => ServiceMainList(
        id: json["id"],
        serviceName: json["service_name"],
        serviceText: json["service_text"],
        status: json["status"],
        link: json["link"],
        icon: json["icon"],
        catId: json["cat_id"],
        cod: json["cod"],
        sortId: json["sort_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_name": serviceName,
        "service_text": serviceText,
        "status": status,
        "link": link,
        "icon": icon,
        "cat_id": catId,
        "cod": cod,
        "sort_id": sortId,
      };
}
