import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkDir1 {
  Future getDir1(
      {required String otmId,
      required String isMaqsadId,
      required String langId,
      required String emode}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get(
        "${MainUrl.mainUrls}/v1/qabul/edu-direction?lang_id=$langId&emode_id=$emode&edu_id=$otmId&is_maqsad=$isMaqsadId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
