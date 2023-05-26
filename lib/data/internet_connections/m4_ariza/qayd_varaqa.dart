import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkDownloadsQaydVaraqa {
  Future<String> getCheckDownloads() async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/v1/qabul/application",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")})); // {MainUrl.mainUrlHeader: box.get("token")}));
    log(jsonEncode(response.data));
    return jsonEncode(response.data);
  }
}
