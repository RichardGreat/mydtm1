import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkCheckVersions {

  static Future<String> checkMobileVersion() async {
    var dio = Dio();
    Response response;
    response = await dio.get(
      "${MainUrl.mainUrls}/home/version",
      // "${MainUrl.mainUrls}/home/mobile-version-data",

    );
    return jsonEncode(response.data);
  }
}
