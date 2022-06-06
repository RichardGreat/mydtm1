import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkEduLangEduChoose{
  var box = Hive.box("online");

  Future<String> getLangEduChoose()async{
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/v1/abitur/get-edu-lang"
        ,options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")})
    );

    return   jsonEncode(response.data);
  }
}