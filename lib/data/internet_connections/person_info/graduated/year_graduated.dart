// https://api.dtm.uz/v1/general-edu/get-byear
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'dart:developer';

class NetworkGraduatedYear {
  Future getYear() async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    log(("${MainUrl.mainUrls}/v1/general-edu/get-byear"));
    log("${MainUrl.mainUrlHeader} ${box.get("token")}");
    response = await dio.get("${MainUrl.mainUrls}/v1/general-edu/get-byear",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
