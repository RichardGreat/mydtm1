import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mydtm/data/model_parse/check_certificates/model_check_certificate.dart';

class InternetCheckCert {
  Future<String> getData({required String pnfl}) async {
    var dio = Dio();
    try {
      // log("https://mandat.uzbmb.uz/API/GetCert?PNFL=$pnfl");
      Response response =
          await dio.get("https://mandat.uzbmb.uz/API/GetCert?PNFL=$pnfl");
      log(jsonEncode(response.data).toString());
      return jsonEncode(response.data).toString() ;


    } catch (e) {
      log(e.toString());
      return "";
    }
  }
}
