// https://api.dtm.uz/v1/transfer-qabul/first-edu?region_id=860&emode_id=1&syear=1&edu_name=Uzbe&mvdir_name=Uzb Yonalsish
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkEduDirPerevod {
  Future getEduDir({required String emode, required String langId}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/v1/transfer-qabul/education?emode_id=$emode&lang_id=$langId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
