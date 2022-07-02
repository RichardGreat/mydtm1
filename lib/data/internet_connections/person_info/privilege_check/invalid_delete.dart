import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkInvalideDelete {
  var box = Hive.box("online");

  Future<String> deleteInvalide() async {
    var dio = Dio();
    Response response;
    response = await dio.delete(
        "${MainUrl.mainUrls}/v1/imtiyoz/invalid-deleted",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
