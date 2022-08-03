import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSetAllTexnikum {
  Future setAllTexnikum({required Map<String, String> mapData}) async {
    try {
      var dio = Dio();
      var box = Hive.box("online");
      Response response;
      response = await dio.post("${MainUrl.mainUrls}/v1/texnikum/abitur",
          data: jsonEncode(mapData),
          options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

      return jsonEncode(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
}
