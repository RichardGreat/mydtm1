import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/digo/model_digo_fan.dart';
import 'package:mydtm/data/model_parse/digo/model_digo_region.dart';
import 'package:mydtm/data/model_parse/digo/model_server_natija.dart';

class ProviderDigo2 extends ChangeNotifier {
  ModelDigo2GetRegion modelDigo2 = ModelDigo2GetRegion(data: []);
  String regId = "", regName = "";
  TextEditingController textEditContFan2 = TextEditingController();

  setDataModel({required ModelDigo2GetRegion modelDigo2GetRegion}) {
    modelDigo2.data.addAll(modelDigo2GetRegion.data);
    modelDigo2.data.add(DataDigo2GetRegion(countDigo: ""));
    notifyListeners();
  }

  addBosh() {
    modelDigo2.data.add(DataDigo2GetRegion(countDigo: ""));
    notifyListeners();
  }

  removeDataModel(int index) {
    modelDigo2.data.removeAt(index);
    notifyListeners();
  }

  /// internetdan ma'lumot olish
  String serverSideInfo = "";
  var dio = Dio();
  late ModelGetRegion modelGetRegion;

  late ModelGetFan modelGetFan;

  Future<ModelGetFan> getFan1() async {
    try {
      serverSideInfo = "0";
      log("message");
      Response response = await dio.get("https://api.uzbmb.uz/v1/digo/fan-one",
          options: Options(headers: {
            "X-Access-Token": "79f72f809904f4dba5df3b410d66b7e4"
            // box.get("token")
          }));
      log(jsonEncode(response.data).toString());
      log("message");
      modelGetFan = ModelGetFan.fromJson(response.data);
      serverSideInfo = "1";
      notifyListeners();
      return modelGetFan;
    } on DioException catch (e) {
      log(e.message.toString());
      serverSideInfo = e.message.toString();
      notifyListeners();
      return ModelGetFan(status: "0", data: []);
    }
  }

  Future<ModelGetFan> getFan2({required String fan1Id}) async {
    try {
      serverSideInfo = "0";
      log("message");
      Response response =
          await dio.get("https://api.uzbmb.uz/v1/digo/fan-two?first=$fan1Id",
              options: Options(headers: {
                "X-Access-Token": "79f72f809904f4dba5df3b410d66b7e4"
                // box.get("token")
              }));
      modelGetFan = ModelGetFan.fromJson(response.data);
      serverSideInfo = "1";
      notifyListeners();
      return modelGetFan;
    } on DioException catch (e) {
      log(e.message.toString());
      serverSideInfo = e.message.toString();
      notifyListeners();
      return ModelGetFan(status: "0", data: []);
    }
  }

  Future<ModelGetFan> getLang(
      {required String fan1Id, required String fan2Id}) async {
    try {
      serverSideInfo = "0";
      log("message");
      Response response = await dio.get(
          "https://api.uzbmb.uz/v1/digo/lang?first=$fan1Id&second=$fan2Id",
          options: Options(headers: {
            "X-Access-Token": "79f72f809904f4dba5df3b410d66b7e4"
            // box.get("token")
          }));
      modelGetFan = ModelGetFan.fromJson(response.data);
      serverSideInfo = "1";
      notifyListeners();
      return modelGetFan;
    } on DioException catch (e) {
      log(e.message.toString());
      serverSideInfo = e.message.toString();
      notifyListeners();
      return ModelGetFan(status: "0", data: []);
    }
  }

  setFan1(
      {required int indexList,
      required String fan1Id,
      required String fan1Name}) {
    modelDigo2.data[indexList] = DataDigo2GetRegion(
      nameReg: modelDigo2.data[0].nameReg,
      idReg: modelDigo2.data[0].idReg,
      idFan1: fan1Id,
      nameFan1: fan1Name,
      idFan2: "",
      nameFan2: "",
      langId: "",
      langName: "",
      countDigo: "",
    );

    log("###");
    log(jsonEncode(modelDigo2).toString());
    notifyListeners();
  }

  setFan2(
      {required int indexList,
      required String fan2Id,
      required String fan2Name}) {
    modelDigo2.data[indexList] = DataDigo2GetRegion(
      nameReg: modelDigo2.data[0].nameReg,
      idReg: modelDigo2.data[0].idReg,
      idFan1: modelDigo2.data[indexList].idFan1,
      nameFan1: modelDigo2.data[indexList].nameFan1,
      idFan2: fan2Id,
      nameFan2: fan2Name,
      langId: "",
      langName: "",
      countDigo: "",
    );
    log("###2");
    log(jsonEncode(modelDigo2).toString());
    notifyListeners();
  }

  setLang2(
      {required int indexList,
      required String lang2Id,
      required String lang2Name}) {
    modelDigo2.data[indexList] = DataDigo2GetRegion(
      nameReg: modelDigo2.data[0].nameReg,
      idReg: modelDigo2.data[0].idReg,
      idFan1: modelDigo2.data[indexList].idFan1,
      nameFan1: modelDigo2.data[indexList].nameFan1,
      idFan2: modelDigo2.data[indexList].idFan2,
      nameFan2: modelDigo2.data[indexList].nameFan2,
      langId: lang2Id,
      langName: lang2Name,
      countDigo: "",
    );
    log("###3");
    log(jsonEncode(modelDigo2).toString());
    notifyListeners();
  }

  setSonDigo2({required int indexList, required String son2}) {
    modelDigo2.data[indexList] = DataDigo2GetRegion(
      nameReg: modelDigo2.data[0].nameReg,
      idReg: modelDigo2.data[0].idReg,
      idFan1: modelDigo2.data[indexList].idFan1,
      nameFan1: modelDigo2.data[indexList].nameFan1,
      idFan2: modelDigo2.data[indexList].idFan2,
      nameFan2: modelDigo2.data[indexList].nameFan2,
      langId: modelDigo2.data[indexList].langId,
      langName: modelDigo2.data[indexList].langName,
      countDigo: son2,
    );
    allCost();
    log("###3");
    log(jsonEncode(modelDigo2).toString());
    notifyListeners();
  }

  String textFan1({required int index}) {
    try {
      return modelDigo2.data[index].nameFan1.toString().length >= 5
          ? modelDigo2.data[index].nameFan1.toString()
          : "Fan tanlang";
    } catch (e) {
      return "Fan tanlang";
    }
  }

  String textFan2({required int index}) {
    try {
      return modelDigo2.data[index].nameFan2.toString().length >= 5
          ? modelDigo2.data[index].nameFan2.toString()
          : "Fan tanlang";
    } catch (e) {
      return "Fan tanlang";
    }
  }

  String textTil({required index}) {
    try {
      return modelDigo2.data[index].langName.toString().length > 5
          ? modelDigo2.data[index].langName.toString()
          : "Til tanlang";
    } catch (e) {
      return "Til tanlang";
    }
  }

  String sonDigo({required index}) {
    try {
      return modelDigo2.data[index].countDigo.isNotEmpty
          ? modelDigo2.data[index].countDigo.toString()
          : "Son kiriting";
    } catch (e) {
      return "Son kiriting";
    }
  }

  int jamSon = 0;

  String allCost() {
    int summa = 0;
    int jamiSoni = 0;
    try {
      for (int i = 0; i < modelDigo2.data.length; i++) {
        if (modelDigo2.data[i].countDigo.isNotEmpty) {
          jamiSoni = jamiSoni + int.parse(modelDigo2.data[i].countDigo);
          summa = summa + int.parse(modelDigo2.data[i].countDigo) * 20000;
        }
      }
      jamSon = jamiSoni;
    } catch (e) {}

    return "$jamiSoni x 20,000 = ${formatMoney(summa.toString())} so'm";
  }

  String allCount() {
    int count = 0;
    for (int i = 0; i < modelDigo2.data.length; i++) {
      try {
        if (modelDigo2.data[i].countDigo.isNotEmpty) {
          count = count + 1;
        }
      } catch (e) {}
    }

    return count.toString();
  }

  String formatMoney(String t) {
    List<String> data = t.split("");

    if (data.length == 5) {
      return "${data[0]}${data[1]},${data[2]}${data[3]}${data[4]}";
    } else if (data.length == 6) {
      return "${data[0]}${data[1]}${data[2]},${data[3]}${data[4]}${data[5]}";
    } else if (data.length == 7) {
      return "${data[0]},${data[1]}${data[2]}${data[3]},${data[4]}${data[5]}${data[6]}";
    } else if (data.length == 8) {
      return "${data[0]}${data[1]},${data[2]}${data[3]}${data[4]},${data[5]}${data[6]}${data[7]}";
    } else if (data.length == 9) {
      return "${data[0]}${data[1]}${data[2]},${data[3]}${data[4]}${data[5]},${data[6]}${data[7]}${data[8]}";
    }
    return "0";
  }

  List<ModelForServer> listServer = [];

  String sentServer = "1";
  ModelGetNatija modelGetNatija = ModelGetNatija(data: []);

  Future sendServer2() async {
    try {
      sentServer = "0";
      notifyListeners();
      List<ModelForServer> listServer = [];

      for (int i = 0; i < modelDigo2.data.length; i++) {
        if (modelDigo2.data[i].countDigo.isNotEmpty) {
          listServer.add(ModelForServer(
              modelDigo2.data[i].langId, modelDigo2.data[i].countDigo));
        }
      }

      Map<String, dynamic> map = {
        "region": regId.toString(),
        "digo": listServer
      };
      log(jsonEncode(map).toString());
      // Response response = await dio.post("https://api.uzbmb.uz/v1/digo/create",
      // data: {
      //   "region": regId.toString(),
      //   "digo":listServer
      // },
      //   options: Options(headers: {"X-Access-Token":"79f72f809904f4dba5df3b410d66b7e4"})
      // );

      // log(jsonEncode(response.data).toString());
      modelGetNatija = ModelGetNatija.fromJson({
        "status": 1,
        "data": [
          {
            "imie": 30309975270036,
            "region_id": 1726,
            "invoice": "18343492646792",
            "payment": 340000,
            "cnt": 17,
            "status": 1,
            "paid": false,
            "phone": "887078499",
            "service_id": 10,
            "get_user_id": null,
            "print_user_id": null,
            "create_at": {"expression": "NOW()", "params": []},
            "update_at": {"expression": "NOW()", "params": []},
            "id": 33153
          }
        ]
      });
      sentServer = "2";
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 1500))
          .then((value) => sentServer = "3");
      notifyListeners();
    } on DioException catch (e) {
      sentServer = e.message.toString();
      notifyListeners();
    }
  }
  getDefault() {
    // modelDigo2.data[indexList]
    for (int i = 0; i < modelDigo2.data.length; i++) {
      if (i > 0) {
        modelDigo2.data[i] = DataDigo2GetRegion(countDigo: "");
      }
    }
    notifyListeners();
  }
}

class ModelDigo2GetRegion {
  dynamic status;
  List<DataDigo2GetRegion> data;

  ModelDigo2GetRegion({
    this.status,
    required this.data,
  });

  factory ModelDigo2GetRegion.fromJson(Map<String, dynamic> json) =>
      ModelDigo2GetRegion(
        status: json["status"],
        data: List<DataDigo2GetRegion>.from(
            json["data"].map((x) => DataDigo2GetRegion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };


}

class DataDigo2GetRegion {
  dynamic idReg;
  dynamic nameReg;
  dynamic idFan1;
  dynamic nameFan1;
  dynamic idFan2;
  dynamic nameFan2;
  dynamic langId;
  dynamic langName;
  String countDigo;

  DataDigo2GetRegion({
    this.idReg,
    this.nameReg,
    this.idFan1,
    this.nameFan1,
    this.idFan2,
    this.nameFan2,
    this.langId,
    this.langName,
    required this.countDigo,
  });

  factory DataDigo2GetRegion.fromJson(Map<String, dynamic> json) =>
      DataDigo2GetRegion(
        idReg: json["id_reg"],
        nameReg: json["name_reg"],
        idFan1: json["id_fan1"],
        nameFan1: json["name_fan1"],
        idFan2: json["id_fan2"],
        nameFan2: json["name_fan2"],
        langId: json["langId"],
        langName: json["langName"],
        countDigo: json["countDigo"],
      );

  Map<String, dynamic> toJson() => {
        "id_reg": idReg,
        "name_reg": nameReg,
        "id_fan1": idFan1,
        "name_fan1": nameFan1,
        "id_fan2": idFan2,
        "name_fan2": nameFan2,
        "langId": langId,
        "langName": langName,
        "countDigo": countDigo,
      };
}

class ModelForServer {
  String tip;
  String cnt;

  ModelForServer(this.tip, this.cnt);

  Map<String, dynamic> toJson() => {"tip": tip, "cnt": cnt};
}
