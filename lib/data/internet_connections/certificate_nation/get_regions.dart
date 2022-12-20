import 'package:hive/hive.dart';

import '../../model_parse/mod_certificate_nation/modal_get_reg.dart';
import 'package:dio/dio.dart';
import 'dart:core';

class NetworkGetRegionCertNation {
  Future<List<ModelCertNationRegion>> getRegion() async {
    Dio dio = Dio();
    var box = Hive.box("online");
    Response response;

    /// lang oxirida qo'shish kerak
    response =
        await dio.get("https://apimobile.dtm.uz/v1/qabul/test-region-list");
    if (response.statusCode == 200) {
      return (response.data as List)
          .entries
          .map((entry) => ModelCertNationRegion())
          .toList();
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
