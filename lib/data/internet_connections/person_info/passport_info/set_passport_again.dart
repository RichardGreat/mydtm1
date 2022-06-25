import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'dart:developer';
class NetworkSetPassportAgain{

  var box = Hive.box("online");
  Future<String> setPassportInfo({required String passSer, required String passNum})async{

    var dio = Dio();
    Response response;
    // response = await dio.post("${MainUrl.mainUrls}/v1/qabul/pasport-change",
    response = await dio.post("https://api.dtm.uz/v1/qabul/pasport-change",
        data: {
          "psser":passSer,
          "psnum":passNum
        },
        options: Options(headers: {MainUrl.mainUrlHeader:box.get("token")})
    );
    log(jsonEncode(response.data));
    return jsonEncode(response.data);

  }

}