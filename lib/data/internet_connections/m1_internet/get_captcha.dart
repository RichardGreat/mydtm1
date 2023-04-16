import 'package:dio/dio.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/data/model_parse/m1_model/parse_captche.dart';

class NetworkGetCaptcha {
  static Future<ModelParseCaptcha> getCaptcha() async {
    var dio = Dio();
    Response response;
    response = await dio.get("${MainUrl.mainUrls}/auth/generate-captcha",
        options: Options(receiveTimeout: const Duration(seconds: 50),));
    return ModelParseCaptcha.fromJson(response.data);
  }
}
