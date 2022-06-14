import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSetServer {
  var box = Hive.box("online");

  Future<String> getSetAllGraduated({required String allData}) async {
    var dio = Dio();
    Response response;

    response = await dio.post(
        "${MainUrl.mainUrls}/v1/general-edu/set-general-edu",
        data: allData,
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
