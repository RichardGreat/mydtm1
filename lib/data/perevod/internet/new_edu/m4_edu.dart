import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkEduNewPerevod {
  Future<String> getEdu(
      {required String emodeId, required String langId}) async {
    var dio = Dio();
    Response response;
    var box = Hive.box("online");
    response = await dio.get(
        "${MainUrl.mainUrls}/v1/transfer-qabul/education?emode_id=$emodeId&lang_id=$langId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

    return jsonEncode(response.data);
  }
}
