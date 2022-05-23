import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkGetToken {
  static Future<String> getTokenModel({required String authCode}) async {
    var dio = Dio();
    Response response;
    response = await dio.post("${MainUrl.mainUrls}/auth/accesstoken", data: {
      "authorization_code": authCode,
      "app_id": "1",
    });

    return jsonEncode(response.data).toString();
  }
}
