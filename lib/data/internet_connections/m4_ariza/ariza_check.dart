import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkArizaCheck {
  Future<String> getCheckAriza() async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/v1/qabul/index",

        options: Options(headers: {MainUrl.mainUrlHeader: "eaa2cc7cd2e80627bd69a65bc95ace16"})); // {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
