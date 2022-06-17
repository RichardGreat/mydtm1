import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkRegistration {
  static Future getRegistration(
      {required Map<String, String> mapRegistration}) async {
    var dio = Dio();
    Response response;
    response = await dio.post("${MainUrl.mainUrls}/auth/check-sms",
        data: mapRegistration);
    return jsonEncode(response.data).toString();
  }
}
