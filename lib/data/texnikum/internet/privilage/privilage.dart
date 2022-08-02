import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSetPrivilegeTexnikum {
  var box = Hive.box("online");

  Future<String> setPrivilegeTexnikum({required FormData formDate}) async {
   try {
      var dio = Dio();

      Response response;
      response = await dio.post(
          "${MainUrl.mainUrls}/v1/texnikum/set-tex-imtiyoz",
          data: formDate,
          options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
      log("##########6");
      log(box.get("token"));
      log("##########7");
      log(response.statusCode.toString());
      log(response.data.toString());
      return jsonEncode(response.data);
    }catch(e){
     log(jsonEncode(e.toString()));
     return e.toString();
   }
  }
}
