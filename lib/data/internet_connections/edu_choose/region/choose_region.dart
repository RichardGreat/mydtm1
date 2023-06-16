// https://api.dtm.uz/v1/region/index
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'dart:developer';
class NetworkEduChooseRegion{
  var box = Hive.box("online");

  Future<String> getChooseEduRegion()async{
  var dio = Dio();
  Response response;
  log("token");
  log(box.get("token"));
  response = await dio.get("${MainUrl.mainUrls}/v1/qabul/test-region-list"
  ,options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")})
  );

    log(jsonEncode(response.data));
    return   jsonEncode(response.data);
  }
}