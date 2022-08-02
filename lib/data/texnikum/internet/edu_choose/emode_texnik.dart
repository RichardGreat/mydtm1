import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkEmodeEDuTexnikum {
  Future getEmodeTexnikum() async {
    try{
      var dio = Dio();
      var box = Hive.box("online");
      Response response;
      print("###e.toString()");
      response = await dio.get("${MainUrl.mainUrls}/v1/texnikum/emode",
          options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

      return jsonEncode(response.data);
    }catch(e){
      print(e.toString());
    }
  }
}
