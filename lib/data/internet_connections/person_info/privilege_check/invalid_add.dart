import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkInvalidePrivilege {
  var box = Hive.box("online");

  Future<String> setInvalide({required String dataInvalid}) async {
    var dio = Dio();
    Response response;
    response = await dio.post("https://api.dtm.uz/v1/imtiyoz/set-invalid",
        data: dataInvalid,
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));

    return jsonEncode(response.data);
  }
}
