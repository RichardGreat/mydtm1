import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkDownloadsAnswerSheet {
  Future<String> getCheckAnswerSheet() async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/v1/qabul/answer",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")})); // {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
