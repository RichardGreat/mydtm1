import 'package:dio/dio.dart';

class NetworkDtmNews {
 static Future<String> getCheckDownloads() async {
    var dio = Dio();
    Response response;
    response = await dio.get("https://dtm.uz/news/?token=4524A47DB75206E46CEBE47AABCEAF2C");
    return response.data;
  }
}
