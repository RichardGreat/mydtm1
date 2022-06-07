import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkCheckUserInfo {
  Future getUserInfo({required String phoneNumber}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get("https://api.dtm.uz/v1/imtiyoz/check-data?username=$phoneNumber",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}