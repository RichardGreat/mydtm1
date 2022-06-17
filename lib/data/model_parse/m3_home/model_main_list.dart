
import 'package:hive_flutter/adapters.dart';

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
  var box = Hive.box("online");
  DataServiceList({
   required this.id,
   required this.categoryName,
   required this.categoryNameRu,
   required this.categoryNameQQ,
   required this.service,
  });

 dynamic id;
 dynamic categoryName;
 dynamic categoryNameRu;
 dynamic categoryNameQQ;
  List<ServiceMainList> service;

  factory DataServiceList.fromJson(Map<String, dynamic> json) => DataServiceList(
        id: json["id"],
    categoryName: json["name"],
    categoryNameRu: json["name_ru"],
    categoryNameQQ: json["name_qq"],
        service:
            List<ServiceMainList>.from(json["service"].map((x) => ServiceMainList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": categoryName,
        "name_ru": categoryNameRu,
        "name_qq": categoryNameQQ,
        "service": List<dynamic>.from(service.map((x) => x.toJson())),
      };
}

class ServiceMainList {
  ServiceMainList({
   required this.id,
   required this.serviceName,
   required this.serviceText,
   required this.serviceTextRu,
   required this.serviceTextQQ,
   required this.serviceNameRu,
   required this.serviceNameQQ,
   required this.status,
   required this.mobilIcon,
   required this.link,
   required this.icon,
   required this.catId,
   required this.cod,
   required this.sortId,
   required this.createdAt,
   required this.updatedAt,
   required this.deleted,
  });

 dynamic id;
 dynamic serviceName;
 dynamic serviceNameRu;
 dynamic serviceNameQQ;
 dynamic serviceText;
 dynamic serviceTextRu;
 dynamic serviceTextQQ;
 dynamic mobilIcon;
 dynamic status;
 dynamic link;
 dynamic icon;
 dynamic catId;
 dynamic cod;
 dynamic sortId;
 dynamic createdAt;
 dynamic updatedAt;
 dynamic deleted;

  factory ServiceMainList.fromJson(Map<String, dynamic> json) => ServiceMainList(
        id: json["id"],
        serviceName: json["name"],
        serviceNameRu: json["name_ru"],
        serviceNameQQ: json["name_qq"],
        serviceText: json["text"],
       serviceTextRu: json["text"],
       serviceTextQQ: json["text"],
        mobilIcon: json["mobil_icon"],
        status: json["status"],
        link: json["link"],
        icon: json["icon"],
        catId: json["cat_id"],
        cod: json["cod"],
        sortId: json["sort_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": serviceName,
        "name_ru": serviceName,
        "name_qq": serviceName,
        "text": serviceText,
        "text_ru": serviceText,
        "text_qq": serviceText,
        "status": status,
        "link": link,
        "mobil_icon": mobilIcon,
        "icon": icon,
        "cat_id": catId,
        "cod": cod,
        "sort_id": sortId,
        "created_at": createdAt,
        "updated_at": sortId,
        "deleted": sortId,
      };
}
