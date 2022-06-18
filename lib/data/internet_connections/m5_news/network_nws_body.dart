import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkNewsBodyId{

  static getBodyById({required String newsId})async{
    Response response;
    var dio = Dio();
    response = await dio.get("https://dtm.uz/news/?token=4524A47DB75206E46CEBE47AABCEAF2C&news_id=$newsId");
    return jsonEncode(response.data);
  }

}