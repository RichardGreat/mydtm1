import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkCheckVersions {

  static Future<String> checkMobileVersion() async {
    var dio = Dio();
    Response response;
    response = await dio.get(
      "https://api.dtm.uz/home/version",
    );
    return jsonEncode(response.data);
  }
}
