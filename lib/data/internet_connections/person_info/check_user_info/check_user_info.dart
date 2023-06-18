import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkCheckUserInfo {
  Future getUserInfo({required String phoneNumber}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    log("${MainUrl.mainUrls}/v1/home/check-data?username=$phoneNumber");
    log( box.get("token"));
    response = await dio.get("${MainUrl.mainUrls}/v1/home/check-data?username=$phoneNumber",

        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
