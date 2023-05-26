import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkEDuTexnikum {
  Future getEduTexnikum(
      {required String eModeId, required String langId}) async {
    try {
      var dio = Dio();
      var box = Hive.box("online");
      Response response;
      response = await dio.get(
          "${MainUrl.mainUrls}/v1/texnikum/education?emode_id=$eModeId&lang_id=$langId",
          options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

      return jsonEncode(response.data);
    } catch (e) {
      log(e.toString());
    }
  }
}
