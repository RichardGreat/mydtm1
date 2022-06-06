import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkOtm {


  Future<String> getOtm1(
      {required String eModeId, required String langId}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl
        .mainUrls}/v1/qabul/edu-list?lang_id=$langId&emode_id=$eModeId",
    options: Options(headers: {MainUrl.mainUrlHeader:box.get("token")})
    );
    return jsonEncode(response.data);
  }
}