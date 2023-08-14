
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';

class NetworkGetSlider {
  var box = Hive.box("online");

  Future<String> getSlider() async {
    var dio = Dio();
    Response response;
    response = await dio.get("https://uzbmb.uz/news/slider.php?token=4524A47DB75206E46CEBE47AABCEAF2C",
      options: Options(receiveTimeout: const Duration(seconds: 25),),
    );
    // log(jsonEncode(response.data).toString());
    return jsonEncode(response.data).toString();
  }
}
