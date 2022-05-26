import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkProfile{

  // Foydalanuvchiga pnfl biriktirilgan bo'lsa
  // {
  // "status": 0,
  // "error_code": 400,
  // "errors": {
  // "imie": false
  // }
  // }
  //
  // {
  // "status": 0,
  // "error_code": 400,
  // "errors": {
  // "imie": false
  // }
  // }
  static Future getPersonImie()async{
    var dio = Dio();
    Response response;

    response = await dio.get("${MainUrl.mainUrls}/v1/person-data/check-imie");
    return jsonEncode(response.data);
  }

}