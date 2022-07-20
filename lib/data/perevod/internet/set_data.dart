import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSetOldEduPerevod {
  var box = Hive.box("online");

  Future<String> setServerOldEdu({required FormData formDate}) async {
    var dio = Dio();
    Response response;

    response = await dio.post(
        "${MainUrl.mainUrls}/v1/transfer-qabul/first-edu",
        data: formDate,

        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}, receiveTimeout: 10000));
    return jsonEncode(response.data);
  }
}
