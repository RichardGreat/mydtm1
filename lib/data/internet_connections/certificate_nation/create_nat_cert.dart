import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkCreateCertNation {
  Dio dio = Dio();
  var box = Hive.box("online");

  Future<String> getNatCert(
      {required String testLangId,
      required String testRegion,
      required String natCerId}) async {
    log("https://apimobile.dtm.uz/v1/national/create/$natCerId");
    log(box.get("token"));
    log(testRegion.toString());
    log(testLangId.toString());

    Response response = await dio.post(
        "${MainUrl.mainUrls}/v1/national/create/$natCerId",
        data: {"test_region": testRegion.toString(), "test_lang": testLangId.toString()},
        options: Options(headers: {"X-Access-Token": box.get("token")}));
    log(response.data.toString());
    if (response.statusCode == 200) {
      return jsonEncode(response.data).toString();
    } else {
      throw Exception("error");
    }
  }
}
