import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSetOldEduPerevod {
  var box = Hive.box("online");

  Future<String> setServerOldEdu({required FormData formDate}) async {
    var dio = Dio();
    Response response;

    try{
      response =
          await dio.post("${MainUrl.mainUrls}/v1/transfer-qabul/first-edu",
              data: formDate,
              options: Options(
                headers: {MainUrl.mainUrlHeader: box.get("token")},
                receiveTimeout: const Duration(seconds: 20),
              ));
      return jsonEncode(response.data);
    }catch(e){
      log(e.toString());
      return "";
    }

  }
}
