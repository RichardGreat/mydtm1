import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSubjectList {
  var box = Hive.box("online");

  Future<String> getSubjectList() async {
    var dio = Dio();
    Response response;
    // log(box.get("lang"));
    print(box.get("language").toString());
    response = await dio.get(

      // "https://uzbmb.uz/news/books.php?token=4524A47DB75206E46CEBE47AABCEAF2C&lang=uz",
      "https://uzbmb.uz/news/books.php?token=4524A47DB75206E46CEBE47AABCEAF2C&lang=${box.get("language").toString() == "1" ? "uz" : box.get("language").toString() == "2" ? "qq" : "ru"}",
      options: Options(
        receiveTimeout: const Duration(seconds: 25),
      ),
    );
    // log("###***");
    // log(jsonEncode(response.data).toString());
    return jsonEncode(response.data);
  }
}
