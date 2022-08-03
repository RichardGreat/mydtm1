import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkLangEduTexnikum {
  Future getLangTexnikum({required String emodId}) async {
    var dio = Dio();
    var box = Hive.box("online");
    Response response;

    response = await dio.get(
        "${MainUrl.mainUrls}/v1/texnikum/lang?emode_id=$emodId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

    return jsonEncode(response.data);
  }
}
