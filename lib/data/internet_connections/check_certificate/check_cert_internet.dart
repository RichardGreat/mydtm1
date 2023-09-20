import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mydtm/data/model_parse/check_certificates/model_check_certificate.dart';

class InternetCheckCert {
  Future<List<ModelCheckCertificate>> getData({required String pnfl}) async {
    var dio = Dio();
    try {
      Response response =
          await dio.get("https://mandat.uzbmb.uz/API/GetCert?PNFL=$pnfl");
      return  (response.data as List).map ((e) => ModelCheckCertificate.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      return [
        ModelCheckCertificate(status: 0, count: 0, message: "", data: [])
      ];
    }
  }
}
