import 'package:dio/dio.dart';

// https://api.dtm.uz/v1/imtiyoz/cert-type?flang_id=1
import 'dart:convert';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'dart:developer';

class NetworkGetLangLevel {
  var box = Hive.box("online");

  Future<String> getForeignCertLevel({required String certType}) async {
    var dio = Dio();
    Response response;
    log(certType);
    response = await dio.get(
        "${MainUrl.mainUrls}/v1/imtiyoz/cert-level?cert_type_id=$certType",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    log(jsonEncode(response.data));
    return jsonEncode(response.data);
  }
}
