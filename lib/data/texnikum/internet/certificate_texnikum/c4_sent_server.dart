import 'dart:convert';
import 'dart:typed_data';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSentServerCertTexnikum {
  var box = Hive.box("online");
  late Uint8List image ;


  Future<String> getNationalCertTexnikum({
    required FormData formDate
  }) async {

    var dio = Dio();
    Response response;

    response = await dio.post("${MainUrl.mainUrls}/v1/texnikum/set-flang-cert",
        data:formDate,
        options: Options(headers: {MainUrl.mainUrlHeader: box.get("token")}));
    log(response.statusCode.toString());
    log(jsonEncode(response.data));
    return jsonEncode(response.data);
  }
}
