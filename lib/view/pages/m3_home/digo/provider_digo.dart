import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/data/model_parse/digo/model_digo_fan.dart';
import 'package:mydtm/data/model_parse/digo/model_digo_region.dart';
import 'package:mydtm/data/model_parse/digo/model_server_natija.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/provider_digo2.dart';

class ProviderDigo extends ChangeNotifier {
  Dio dio = Dio();

  String serverSideInfo = "0";
  ModelGetFan modelGetFan = ModelGetFan(status: "0", data: []);
  ModelGetRegion modelGetRegion = ModelGetRegion(status: "", data: []);
  var box = Hive.box("online");

  String regId = "";
  String regName = "";
  String fan1Id = "";
  String fan1Name = "";
  String fan2Id = "";
  String fan2Name = "";

  String langId = "";
  String langName = "";
  String countDigo = "";

  // https://api.uzbmb.uz/v1/region/index

  setRegId({required String id, required String name}) {
    regId = id;
    regName = name;
    fan1Id = "";
    fan1Name = "";
    fan2Id = "";
    fan2Name = "";
    langId = "";
    langName = "";
    countDigo = "";
    notifyListeners();
  }

  setFan1Id({required String id, required String fan1}) {
    fan1Id = id;
    fan1Name = fan1;
    fan2Id = "";
    fan2Name = "";
    langId = "";
    langName = "";
    countDigo = "";
    notifyListeners();
  }

  setFan2Id({required String id, required String fan2}) {
    fan2Id = id;
    fan2Name = fan2;
    langId = "";
    langName = "";
    countDigo = "";
    notifyListeners();
  }

  setLang({required String id, required String lang}) {
    langId = id;
    langName = lang;
    countDigo = "";
    notifyListeners();
  }

  setSonDigo({required String count}) {
    countDigo = count;
    notifyListeners();
  }

  Future<ModelGetRegion> getRegion() async {
    try {
      serverSideInfo = "0";
      log("message");
      Response response = await dio.get("https://api.uzbmb.uz/v1/region/index",
          options: Options(headers: {
            "X-Access-Token":  box.get("token").toString()
            // box.get("token")
          }));
      log(jsonEncode(response.data).toString());
      log("message");
      modelGetRegion = ModelGetRegion.fromJson(response.data);
      serverSideInfo = "1";
      notifyListeners();
      return modelGetRegion;
    } on DioException catch (e) {
      log(e.message.toString());
      serverSideInfo = e.message.toString();
      notifyListeners();
      return ModelGetRegion(status: "0", data: []);
    }
  }

  Future<ModelGetFan> getFan1() async {
    try {
      serverSideInfo = "0";
      log("message");
      Response response = await dio.get("https://api.uzbmb.uz/v1/digo/fan-one",
          options: Options(headers: {
            "X-Access-Token":  box.get("token").toString()
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
                "X-Access-Token": box.get("token").toString()
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
            "X-Access-Token": box.get("token").toString()
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


  String sentServer = "1";
  ModelGetNatija modelGetNatija = ModelGetNatija(data: []);
  Future sendServer()async{
    try{
      sentServer = "0";
      notifyListeners();
      List<ModelForServer> listServer = [];

      listServer.add(ModelForServer(langId, countDigo));
      Map<String, dynamic> map = {
        "region": regId.toString(),
        "digo":listServer
      };
      log( jsonEncode(map).toString());
      // Response response = await dio.post("https://api.uzbmb.uz/v1/digo/create",
      // data: {
      //   "region": regId.toString(),
      //   "digo":listServer
      // },
      //   options: Options(headers: {"X-Access-Token":"79f72f809904f4dba5df3b410d66b7e4"})
      // );

      // log(jsonEncode(response.data).toString());
      modelGetNatija  = ModelGetNatija.fromJson({
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
            "create_at": {
              "expression": "NOW()",
              "params": []
            },
            "update_at": {
              "expression": "NOW()",
              "params": []
            },
            "id": 33153
          }
        ]
      });
      sentServer = "2";
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 1500)).then((value) => sentServer = "3");
      notifyListeners();
    }on DioException catch(e){
      sentServer = e.message.toString();
      notifyListeners();
    }
  }

  getDefault(){
    regId = "";
    regName = "";
    fan1Id = "";
    fan1Name = "";
    fan2Id = "";
    fan2Name = "";
    langId = "";
    langName = "";
    countDigo = "";
    sentServer = "1";
    notifyListeners();

  }

  String textCostAllDigo = "";
  String textCostNumber = "";


  bool boolGetTanishdimBackColor = true;
   boolColorRed(){
    boolGetTanishdimBackColor = false;
    notifyListeners();
  }


  bool boolGetTanishdim = false;
   boolGetTanishdimFunc(){
     boolGetTanishdim = true;
     boolGetTanishdimBackColor = true;
  notifyListeners();
  }

  getNumCost({required int numDigo}) {
    try{
      textCostNumber = numDigo.toString();
      textCostAllDigo = formatMoney((numDigo * 20000).toString());
    }catch(e){
      countDigo = "";
    }
    notifyListeners();
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
}
