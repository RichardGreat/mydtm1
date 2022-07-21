import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkEduTypeNewPerevod {
  Future<String> getEduTypeNewPerevod() async {
    var dio = Dio();
    Response response;
    var box = Hive.box("online");
    response = await dio.get(
        "${MainUrl.mainUrls}/v1/transfer-qabul/emode",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

    return jsonEncode(response.data);
  }
}
