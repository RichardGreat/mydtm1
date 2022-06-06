import 'dart:convert';

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkOtm {


  Future<String> getOtm(
      {required String eModeId, required String langId}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl
        .mainUrls}/v1/qabul/edu-list?lang_id=$langId&emode_id=$eModeId",
    options: Options(headers: {MainUrl.mainUrlHeader:box.get("token")})
    );
    return jsonEncode(response.data);
  }
  // https://api.dtm.uz/v1/qabul/edu-second-list?lang_id=1&dir_id=13756&emode_id=1&is_item=10160,13756



  Future<String> getOtm2(
      {required String eModeId, required String langId, required String dirId, required String isItem}) async {
    try{
      var box = Hive.box("online");
      var dio = Dio();
      Response response;
      log("${MainUrl.mainUrls}/v1/qabul/edu-second-list?lang_id=$langId&dir_id=$dirId&emode_id=$eModeId&is_item=$isItem");
      log("${MainUrl.mainUrlHeader} ${box.get("token")}");
      response = await dio.get("${MainUrl.mainUrls}/v1/qabul/edu-second-list?lang_id=$langId&dir_id=$dirId&emode_id=$eModeId&is_item=$isItem",
          options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

      return jsonEncode(response.data);
    }catch(e){
      log(e.toString());
      return "";
    }
  }

}