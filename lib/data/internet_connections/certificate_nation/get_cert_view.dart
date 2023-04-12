import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

///sertifikat topshirilgan arizalarni olish

class NetworkCertificateView {
  Dio dio = Dio();
  var box = Hive.box("online");

  Future<String> getCertView(
      {required String testLang, required String serviceID}) async {
    log(box.get("token"));

    Response response = await dio.get(
      "${MainUrl.mainUrls}/v1/national/index/$serviceID/$testLang",
        options: Options(headers: {"X-Access-Token": box.get("token")
        }));
    log("${MainUrl.mainUrls}/v1/national/index/$serviceID/$testLang");
    log(jsonEncode(response.data).toString());
    if (response.statusCode == 200) {
      return jsonEncode(response.data).toString();
    } else {
      throw Exception("error class NetworkCertificateView");
    }
  }
}
