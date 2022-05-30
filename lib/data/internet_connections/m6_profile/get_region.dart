import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkGetRegion{

  Future<String> getRegions()async{
    var dio = Dio();
    Response response;
    var box = Hive.box("online");
    response = await dio.get("${MainUrl.mainUrls}/v1/region/country",
    options: Options(headers: {MainUrl.mainUrlHeader:box.get("token")})
    );

    return jsonEncode(response.data);
  }

}