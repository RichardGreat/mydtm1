import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkEmodeChoose {
  Future getEmodeItem({required String langId}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;

    response = await dio.get(
        "${MainUrl.mainUrls}/v1/qabul/edu-emode?lang_id=$langId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }

  Future getEmodeItem2(
      {required String langId,
      required String dirId,
      required String isItem}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get(
        "${MainUrl.mainUrls}/v1/qabul/edu-second-emode?lang_id=$langId&dir_id=$dirId&is_item=$isItem",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}