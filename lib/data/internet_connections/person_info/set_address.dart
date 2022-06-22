import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSetAddress{

  var box = Hive.box("online");
  Future<String> setAddressInfo({required String setAddressInfos})async{

    var dio = Dio();
    Response response;
    response = await dio.post("${MainUrl.mainUrls}/v1/person-data/set-address",
    data: setAddressInfos,
    options: Options(headers: {MainUrl.mainUrlHeader:box.get("token")})
    );
    return jsonEncode(response.data);

  }

}