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
  log("${MainUrl.mainUrls}/v1/person-data/get-imie");
  log("${MainUrl.mainUrlHeader}:${box.get("token")}");
    log(jsonEncode(response.data));
  log(response.statusCode.toString());
    return jsonEncode(response.data);
  }
}
