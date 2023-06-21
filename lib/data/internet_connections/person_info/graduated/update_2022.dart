import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkUpdate2022 {
  var box = Hive.box("online");

  Future<String> getSet2022() async {
    var dio = Dio();
    Response response;

    response = await dio.get("${MainUrl.mainUrls}/v1/general-edu/update",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

    log( jsonEncode(response.data).toString());
    return jsonEncode(response.data).toString();
  }
}
