import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkGetForeignLangTexnikum{

  Future getUserInfoTexnikum()async{
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    log("lang foregien");
    response = await dio.get("${MainUrl.mainUrls}/v1/texnikum/flang-list",
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);

  }


}