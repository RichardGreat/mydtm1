import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/view/pages/m2_main_page/notification_news/model_news.dart';

class InternetCheckNews {
  static final dio = Dio();
  var box = Hive.box("online");
  String langNames = "";
  List<ModelCheckNewsNotification> listModel = [];
  Future<List<ModelCheckNewsNotification>> getNews() async {
    try {

      Response response = await dio.get(
          "https://uzbmb.uz/news/notification.php?token=4524A47DB75206E46CEBE47AABCEAF2C&lang=${getLang()}");
      listModel = ((jsonDecode(response.data)) as List)
          .map((e) => ModelCheckNewsNotification.fromJson(e))
          .toList();
      return listModel;
    } on DioException catch (e) {
      log("e.toString()");
      log(e.toString());
      return [];
    } catch (e) {
      log("@!#");
      log(e.toString());
      return [];
    }
  }

  String getLang() {
    if (box.get("language") == "1") {
      return langNames = "uz";
    } else if (box.get("language") == "2") {
      return langNames = "qr";
    } else if (box.get("language") == "3") {
      return langNames = "ru";
    } else {
      return "uz";
    }
  }
}
