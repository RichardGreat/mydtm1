class ModelGetRegion {
  dynamic status;
  List<DataGetRegion> data;

  ModelGetRegion({
     this.status,
    required this.data,
  });

  factory ModelGetRegion.fromJson(Map<String, dynamic> json) => ModelGetRegion(
    status: json["status"],
    data: List<DataGetRegion>.from(json["data"].map((x) => DataGetRegion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataGetRegion {
 dynamic id;
 dynamic name;
 dynamic orderId;
 dynamic parentId;

  DataGetRegion({
    required this.id,
    required this.name,
    required this.orderId,
    required this.parentId,
  });

  factory DataGetRegion.fromJson(Map<String, dynamic> json) => DataGetRegion(
    id: json["id"],
    name: json["name"],
    orderId: json["order_id"],
    parentId: json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "order_id": orderId,
    "parent_id": parentId,
  };
}
