import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkGetIMie {
  var box = Hive.box("online");

  Future<String> getIMieInformation() async {
    var dio = Dio();
    Response response;

    response = await dio.get("${MainUrl.mainUrls}/v1/person-data/get-imie",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
        log("${MainUrl.mainUrlHeader}:${box.get("token")}");
    return jsonEncode(response.data);
  }
}
