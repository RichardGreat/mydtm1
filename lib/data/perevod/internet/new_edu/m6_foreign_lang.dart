
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkForeignLangPerevod {
  Future<String> getForeignLang(
      {required String dirID}) async {
    var dio = Dio();
    Response response;
    var box = Hive.box("online");
    response = await dio.get(
        "${MainUrl.mainUrls}/v1/transfer-qabul/flang?id=$dirID",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    log(jsonEncode(response.data));
    return jsonEncode(response.data);
  }
}
