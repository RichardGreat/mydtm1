import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSetImie {
  var box = Hive.box("online");

  Future setImie() async {
    var dio = Dio();
    Response response;
    response = await dio.post("${MainUrl.mainUrls}/v1/person-data/set-imie",
        options: Options(headers: {"X-Access-Token": box.get("token")}));
    return jsonEncode(response.data);
  }
}