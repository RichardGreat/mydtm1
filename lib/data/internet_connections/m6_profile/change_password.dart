import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkChangePassword{
  Future<String> getChangePhoneNumber({required Map<String, dynamic> mapChangePassword}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;

    response = await dio.post(
        "${MainUrl.mainUrls}/auth/request-password-reset",
        data: mapChangePassword,
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
