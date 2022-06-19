import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSetLanguage{

  var box = Hive.box("online");
  Future<String> setLanguageUser({required String setLang})async{

    var dio = Dio();
    Response response;
    response = await dio.post("${MainUrl.mainUrls}/v1/settings/set-lang",
        data: {
              "lang":setLang
        },
        options: Options(headers: {MainUrl.mainUrlHeader:box.get("token")})
    );
    return jsonEncode(response.data);

  }

}