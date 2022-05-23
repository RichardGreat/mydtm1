import 'dart:convert';

class StaticListForDelete {
  List<ModelListForDelete> listForDelete = [];

  List<ModelListForDelete> getListDelete() {
    listForDelete = [
      ModelListForDelete(name: "Chet tili", category: 0, id: 1),

      ModelListForDelete(name: "Oliy ta'lim", category: 1, id: 2),
      ModelListForDelete(name: "TOEFL ITM", category: 1, id: 3),
      ModelListForDelete(name: "Diagnostika", category: 1, id: 4),
      ModelListForDelete(name: "Malaka oshirish", category: 1, id: 5),
      ModelListForDelete(name: "O'qtuvchilar uchun aptes", category: 2, id: 6),
      ModelListForDelete(name: "O'zbek tili adabiyot", category: 2, id: 7),
      ModelListForDelete(name: "Rus tili adabiyot", category: 2, id: 8),
      ModelListForDelete(name: "Kimyo", category: 2, id: 9),
      ModelListForDelete(name: "Biologiya", category: 2, id: 10),
      ModelListForDelete(name: "Qoraqalpoq", category: 3, id: 11),
      ModelListForDelete(name: "Fizika", category: 3, id: 12),
      ModelListForDelete(name: "Matematika", category: 3, id: 13),

      ModelListForDelete(
          name: "Davlat xavfsizlik xizmati akademiyasi", category: 4, id: 14),

      ModelListForDelete(name: "O'qishni ko'chirish", category: 5, id: 15),

      ModelListForDelete(
          name: "Adliya vazirligining yutidik texnikumi", category: 6, id: 16),

      ModelListForDelete(
        name: "Informatika",
        category: 6,
        id: 17,
      )
    ];
    return listForDelete;
  }


}

class ModelListForDelete {
  String name;
  int id;
  int category;

  ModelListForDelete(
      {required this.name, required this.category, required this.id});
  factory ModelListForDelete.fromJson(Map<String, dynamic> json) => ModelListForDelete(
    id: json["id"],
    name: json["name"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "id": id,
    "name": name,

  };
}
