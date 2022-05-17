import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_auth_success.dart';

class NetworkAuthorize {

  static Future<String> getAuthorize(
      {required Map<String, String> mapAuthorize}) async {
    
    // /auth/authorize
    var dio = Dio();
    Response response;
    response = await dio.post("${MainUrl.mainUrls}/auth/authorize",
    data: mapAuthorize
    );
    return jsonEncode(response.data).toString();
  }
}
