import 'dart:developer';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkUzbEduDirPerevod {
  Future getUzbEduDir({required String emod, required String langId, required String eduId}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    log("${MainUrl.mainUrls}/v1/transfer-qabul/mvdir?emode_id=$emod&lang_id=$langId&edu_id=$eduId");
    response = await dio.get("${MainUrl.mainUrls}/v1/transfer-qabul/mvdir?emode_id=$emod&lang_id=$langId&edu_id=$eduId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
