import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkChangePhoneNumber{
  Future<String> getChangePhoneNumber({required String phoneNumber}) async {
    var box = Hive.box("online");
    var dio = Dio();
    Response response;

    response = await dio.post(
        "${MainUrl.mainUrls}/v1/person-data/change-phone",
        data: {"phone":phoneNumber},
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    return jsonEncode(response.data);
  }
}
