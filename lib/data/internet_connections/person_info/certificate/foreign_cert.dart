import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkForeignCert {
  var box = Hive.box("online");

  Future<String> getForeignCert() async {
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/v1/imtiyoz/get-flang-cert",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
