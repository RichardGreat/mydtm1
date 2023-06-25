import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSendServer{

  Future<String> sendServerAll({required String allData})async{
    var box = Hive.box("online");
    var dio = Dio();
    Response response;

    try{
      response = await dio.post("${MainUrl.mainUrls}/v1/qabul/create",
          data: allData,
          options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
      return jsonEncode(response.data);
    }catch(e){
      log(e.toString());
      return "";
    }
  }
}