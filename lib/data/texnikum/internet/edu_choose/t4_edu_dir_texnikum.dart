import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkEDuDirTexnikum {
  Future getEduDirTexnikum(
      {required String eModeId,
      required String langId,
      required String eduId}) async {
    try {
      var dio = Dio();
      var box = Hive.box("online");
      Response response;
      response = await dio.get(
          "${MainUrl.mainUrls}/v1/texnikum/mvdir?emode_id=$eModeId&lang_id=$langId&edu_id=$eduId",
          options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

      return jsonEncode(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
}
