import 'dart:core';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../../model_parse/mod_certificate_nation/modal_get_reg.dart';

class NetworkGetRegionCertNation {

  Future getRegion() async {
    Dio dio = Dio();
    var box = Hive.box("online");
    Response response;

    /// lang oxirida qo'shish kerak
    response =
        await dio.get("https://apimobile.dtm.uz/v1/qabul/test-region-list", options: Options(headers: {"X-Access-Token":box.get("token")}));
    log(ModelCertNationRegion.fromJson(response.data).data.toString());
    if (response.statusCode == 200) {
      return  ModelCertNationRegion.fromJson(response.data).data;

      // (response.data as List)
      //   .map((e) => ModelCertNationRegion.fromJson(e))
      //   .toList();
    } else {
      throw Exception("error");
    }
  }
}
// ModelCertNationRegion
// (response.data as List).entries
//     .map((entry) => ModelCertNationRegion(
// regionId: entry.key.toString(),
// regionName: entry.value,
// ))
// .toList();
