import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkLangTest{
  
  var box = Hive.box("online");
  Future<String> getTestLang({required String langId})async{
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/v1/qabul/fland-edu?flang_id=$langId",
    options: Options(headers: {MainUrl.mainUrlHeader:box.get("token")})
    );

    return jsonEncode(response.data);
  }
  
}