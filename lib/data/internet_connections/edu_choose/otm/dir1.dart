import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'dart:developer';
class NetworkDir1 {
  Future getDir1(
      {required String otmId,
      required String isMaqsadId,
      required String langId,
      required String emode}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get(
        "${MainUrl.mainUrls}/v1/abitur/edu-direction?lang_id=$langId&emode_id=$emode&edu_id=$otmId&is_maqsad=$isMaqsadId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }

  Future getDir2(
      {required String otmId,
      required String dirId,
      required String isMaqsadId,
      required String langId,
      required String isItem,
      required String emode}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    log("${MainUrl.mainUrls}/v1/qabul/edu-second-direction?lang_id=$langId&emode_id=$emode&edu_id=$otmId&dir_id=$dirId&is_item=$isItem&is_maqsad=$isMaqsadId");
    log("${MainUrl.mainUrlHeader} ${box.get("token")}");

    response = await dio.get(
        "${MainUrl.mainUrls}/v1/qabul/edu-second-direction?lang_id=$langId&emode_id=$emode&edu_id=$otmId&dir_id=$dirId&is_item=$isItem&is_maqsad=$isMaqsadId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);

  }
  Future getDir3(
      {
        required String dirId,
        required String langId,
        required String isItem,
    }) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get(
        "${MainUrl.mainUrls}/v1/qabul/edu-second-direction?lang_id=$langId&dir_id=$dirId&is_item=$isItem",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
//https://api.dtm.uz/v1/qabul/edu-second-direction?lang_id=1&emode_id=1&edu_id=301&dir_id=10001&is_item=10001&is_maqsad=0
