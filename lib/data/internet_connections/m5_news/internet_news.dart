import 'package:dio/dio.dart';

class NetworkDtmNews {
 static Future<String> getCheckDownloads({required String langName}) async {
    var dio = Dio();
    Response response;
    response = await dio.get("https://uzbmb.uz/news/?token=4524A47DB75206E46CEBE47AABCEAF2C&lang=$langName");
    return response.data;
  }
}
