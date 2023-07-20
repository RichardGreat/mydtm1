// https://api.uzbmb.uz/v1/transfer-qabul/abitur
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

// {
// "test_region":1712,
// "emode_id":1,
// "lang_id":1,
// "direction_id":1455,
// "edu_id":306,
// "flang":1,
// "comment":"text"
// }
class NetworkTestCreatePerevod {
  Future<String> setCreatePerevod({
    required String testRegionId,
    required String emodeId,
    required String langId,
    required String directionId,
    required String eduId,
    required String flangId,
    required String text,
  }) async {
    var dio = Dio();
    Response response;
    var box = Hive.box("online");
    response = await dio.post("${MainUrl.mainUrls}/v1/transfer-qabul/abitur",
        data: {
          "test_region": testRegionId,
          "emode_id": emodeId,
          "lang_id": langId,
          "direction_id": directionId,
          "edu_id": eduId,
          "flang": flangId,
          "comment": text
        },
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

    return jsonEncode(response.data);
  }
}
