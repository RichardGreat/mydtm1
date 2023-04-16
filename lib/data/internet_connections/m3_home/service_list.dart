import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkServiceList {
  var box = Hive.box("online");

  Future<String> getServiceList() async {
    var dio = Dio();
    Response response;

    response = await dio.get("${MainUrl.mainUrls}/home/service-list",
      options: Options(receiveTimeout: const Duration(seconds: 60),),
      );
    return jsonEncode(response.data);
  }
}
