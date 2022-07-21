import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkCheckUserInfoPerevod {
  Future getUserInfoPerevod() async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/v1/imtiyoz/check-data-transfer",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
