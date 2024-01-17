import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/data/model_parse/digo/digo_get_all.dart';

class ProviderDigoMain extends ChangeNotifier {
  var dio = Dio();
  late ModelDigoAll modelDigoAll;

  String textServerResponse = "0";
  var box = Hive.box("online");

  List<Datum> listDatum = [];

  getAllData({required String pageNum}) async {
    try {
      textServerResponse = "0";
      notifyListeners();
      var response = await dio.get(
          "http://api.uzbmb.uz/v1/digo/index?page=$pageNum&per-page=5",
          options: Options(
              headers: {"X-Access-Token": box.get("token").toString()}));

      modelDigoAll = ModelDigoAll.fromJson(response.data);
      listDatum = modelDigoAll.data.data;

      textServerResponse = "1";
      notifyListeners();
    } on DioException catch (e) {
      textServerResponse = e.message.toString();
      notifyListeners();
    }
  }

  String textNextNull = "0";

  getNextPage({required String pageNum}) async {
    try {
      var response = await dio.get(
          "http://api.uzbmb.uz/v1/digo/index?page=$pageNum&per-page=5",
          options: Options(headers: {"X-Access-Token": box.get("token")}));
      log(jsonEncode(response.data));

      if (listDatum.isNotEmpty) {
        modelDigoAll = ModelDigoAll.fromJson(response.data);
        listDatum.addAll(modelDigoAll.data.data);
        if (modelDigoAll.data.data.isEmpty) {
          textNextNull = "1";
          notifyListeners();
        }
      } else {
        modelDigoAll = ModelDigoAll.fromJson(response.data);
        listDatum = modelDigoAll.data.data;
      }
      notifyListeners();
    } on DioException catch (e) {
      textServerResponse = e.message.toString();
      notifyListeners();
    }
  }

  String getFanName({required int index}) {
    return box.get("lang").toString() == "1" ||
            box.get("lang").toString() == "null"
        ? listDatum[index].order[0].dir.fanOne.name.toString()
        : box.get("lang").toString() == "2"
            ? listDatum[index].order[0].dir.fanOne.nameQq.toString()
            : listDatum[index].order[0].dir.fanOne.nameRu.toString();
  }

  String getFanName2({required int index}) {
    return box.get("lang").toString() == "1" ||
            box.get("lang").toString() == "null"
        ? listDatum[index].order[0].dir.fanTwo.name.toString()
        : box.get("lang").toString() == "2"
            ? listDatum[index].order[0].dir.fanTwo.nameQq.toString()
            : listDatum[index].order[0].dir.fanTwo.nameRu.toString();
  }

  String getLangKitob({required int index}) {
    return box.get("lang").toString() == "1" ||
            box.get("lang").toString() == "null"
        ? listDatum[index].order[0].dir.lang.nameUz.toString()
        : box.get("lang").toString() == "2"
            ? listDatum[index].order[0].dir.lang.nameQq.toString()
            : listDatum[index].order[0].dir.lang.nameRu.toString();
  }
}
