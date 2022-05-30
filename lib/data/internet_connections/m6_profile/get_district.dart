import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkDistrict {
  Future<String> getDistricts({required String parentId}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;

    response = await dio.get(
        "${MainUrl.mainUrls}/v1/region/district?parent_id=$parentId",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
