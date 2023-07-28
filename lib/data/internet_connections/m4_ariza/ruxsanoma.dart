import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkDownloadsRuxsatnoma {
  Future<String> getCheckDownloads() async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    // response = await dio.get("${MainUrl.mainUrls}/v1/qabul/application",
        // {"status":1,"src":"https://my.uzbmb.uz/allow-download/072137568522ec7611d6789cc3f4f7db"}
    response = await dio.get("${MainUrl.mainUrls}/v1/qabul/allow",
        options: Options(headers: {MainUrl.mainUrlHeader:  box.get("token")})); // {MainUrl.mainUrlHeader: box.get("token")}));
    log(jsonEncode(response.data));
    return jsonEncode(response.data).toString();
  }
}
