import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkGetGraduatedNames {
  var box = Hive.box("online");

  Future<String> getAllGraduatedName({required String gEduType, required String districtId}) async {
    var dio = Dio();
    Response response;
    log(gEduType.toString());
    log(districtId.toString());
    log("${MainUrl.mainUrls}/v1/general-edu/get-general-edu-list?edu_type=$gEduType&tuman_id=$districtId");
    log(MainUrl.mainUrlHeader);
    log(box.get("token"));
    Map<String, String> toServer = {
    "general_edu_type":gEduType,
    "region_id":districtId
    };
    response = await dio.get(
        "${MainUrl.mainUrls}/v1/general-edu/get-general-edu-list?edu_type=$gEduType&tuman_id=$districtId",
        // data: jsonEncode(toServer),
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
   try{
     return jsonEncode(response.data).toString();
   }catch(e){
     return "server error";
   }
  }
}
