import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkGetAddressInfo {

  Future<String> getAddressInfo() async {
    var dio = Dio();
    Response response;
    var box = Hive.box("online");
    response =
    await dio.get("${MainUrl.mainUrls}/v1/person-data/get-address",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")})

    );
    log(jsonEncode("${MainUrl.mainUrls}/v1/person-data/get-address"));
    log(jsonEncode("${MainUrl.mainUrlHeader}:${box.get("token")}"));
    log(jsonEncode(response.data));
    log(response.statusCode.toString());
    return jsonEncode(response.data).toString();
  }

}