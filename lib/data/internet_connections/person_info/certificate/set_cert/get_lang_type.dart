// https://api.dtm.uz/v1/imtiyoz/cert-type?flang_id=1
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkGetLangType {
  var box = Hive.box("online");

  Future<String> getForeignCertType({required String langId}) async {
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/v1/imtiyoz/cert-type?flang_id=$langId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
