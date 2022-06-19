import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:developer';

class NetworkNewsBodyId{

  static getBodyById({required String newsId, required languageName})async{
    Response response;
    var dio = Dio();
    log("https://dtm.uz/news/?token=4524A47DB75206E46CEBE47AABCEAF2C&lang=$languageName&news_id=$newsId");
    response = await dio.get("https://dtm.uz/news/?token=4524A47DB75206E46CEBE47AABCEAF2C&lang=$languageName&news_id=$newsId");
    log( jsonEncode(response.data));
    return jsonEncode(response.data);
  }

}