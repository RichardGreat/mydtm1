class StaticListForDelete {
  List<ModelListForDelete> listForDelete = [];

  List<ModelListForDelete> getListDelete() {
    listForDelete = [
      ModelListForDelete(status: 1, name: "Chet tili", category: 0, id: 1),
      ModelListForDelete(status: 1, name: "Oliy ta'lim", category: 1, id: 2),
      ModelListForDelete(status: 0, name: "TOEFL ITM", category: 1, id: 3),
      ModelListForDelete(status: 1, name: "Diagnostika", category: 1, id: 4),
      ModelListForDelete(status: 1, name: "Malaka oshirish", category: 1, id: 5),
      ModelListForDelete(status: 1, name: "O'qtuvchilar uchun aptes", category: 2, id: 6),
      ModelListForDelete(status: 1, name: "O'zbek tili adabiyot", category: 2, id: 7),
      ModelListForDelete(status: 0, name: "Rus tili adabiyot", category: 2, id: 8),
      ModelListForDelete(status: 0, name: "Kimyo", category: 2, id: 9),
      ModelListForDelete(status: 0, name: "Biologiya", category: 2, id: 10),
      ModelListForDelete(status: 0, name: "Qoraqalpoq", category: 3, id: 11),
      ModelListForDelete(status: 0, name: "Fizika", category: 3, id: 12),
      ModelListForDelete(status: 0, name: "Matematika", category: 3, id: 13),
      ModelListForDelete(status: 0, name: "Davlat xavfsizlik ", category: 14, id: 14),
      ModelListForDelete(status: 0, name: "O'qishni ko'chirish", category: 55, id: 15),
      ModelListForDelete(status: 0, name: "Adliya vazirligining ", category: 16, id: 16),
      ModelListForDelete(status: 1, name: "Informatika", category: 6, id: 17)
    ];
    return listForDelete;
  }


}

class ModelListForDelete {
  String name;
  int id;
  int category;
  int status;

  ModelListForDelete(
      {required this.name,
      required this.category,
      required this.id,
      required this.status});

  factory ModelListForDelete.fromJson(Map<String, dynamic> json) =>
      ModelListForDelete(
        id: json["id"],
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
