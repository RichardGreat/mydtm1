class StaticListForDelete {
  List<ModelListForDelete> listForDelete = [];

  List<ModelListForDelete> getListDelete() {
    listForDelete = [
      ModelListForDelete(status: 0,serviceName: "Top xizmatlar", name: "Chet tili", category: 0, id: 1),
      ModelListForDelete(status: 1,serviceName: "Top xizmatlar", name: "Oliy ta'lim", category: 0, id: 2),
      ModelListForDelete(status: 0,serviceName: "Top xizmatlar", name: "TOEFL ITM", category: 0, id: 3),
      ModelListForDelete(status: 1,serviceName: "Top xizmatlar", name: "Diagnostika", category: 0, id: 4),
      ModelListForDelete(status: 1,serviceName: "Top xizmatlar", name: "Malaka oshirish", category: 0, id: 5),
      ModelListForDelete(status: 1,serviceName: "Chet tili o'qtuvchilari uchun test sinovi", name: "O'qtuvchilar uchun aptes", category: 2, id: 6),
      ModelListForDelete(status: 1,serviceName: "Chet tili o'qtuvchilari uchun test sinovi", name: "O'zbek tili adabiyot", category: 2, id: 7),
      ModelListForDelete(status: 0,serviceName: "Chet tili o'qtuvchilari uchun test sinovi", name: "Rus tili adabiyot", category: 2, id: 8),
      ModelListForDelete(status: 0,serviceName: "Milliy sertifikatlar", name: "Kimyo", category: 3, id: 9),
      ModelListForDelete(status: 0,serviceName: "Milliy sertifikatlar", name: "Biologiya", category: 3, id: 10),
      ModelListForDelete(status: 0,serviceName: "Milliy sertifikatlar", name: "Qoraqalpoq", category: 3, id: 11),
      ModelListForDelete(status: 0,serviceName: "Milliy sertifikatlar", name: "Fizika", category: 3, id: 12),
      ModelListForDelete(status: 0,serviceName: "Milliy sertifikatlar", name: "Matematika", category: 3, id: 13),
      ModelListForDelete(status: 0,serviceName: "Davlat xavfsizlik xizmati", name: "Davlat xavfsizlik ", category: 14, id: 14),
      ModelListForDelete(status: 0,serviceName: "O'qishni ko'chirish", name: "O'qishni ko'chirish ", category: 55, id: 15),
      ModelListForDelete(status: 0,serviceName: "Yuridik texnikum", name: "Adliya vazirligining yuridik texnikumlari", category: 16, id: 16),
      ModelListForDelete(status: 1,serviceName: "Informatika", name: "Informatika", category: 6, id: 17)
    ];
    return listForDelete;
  }


}

class ModelListForDelete {
  String name;
  int id;
  int category;
  String serviceName;
  int status;

  ModelListForDelete(
      {required this.name,
      required this.serviceName,
      required this.category,
      required this.id,
      required this.status});

  factory ModelListForDelete.fromJson(Map<String, dynamic> json) =>
      ModelListForDelete(
        id: json["id"],
        serviceName: json["service_name"],
        status: json["status"],
        name: json["name"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "id": id,
        "status": status,
        "name": name,
      };
}
