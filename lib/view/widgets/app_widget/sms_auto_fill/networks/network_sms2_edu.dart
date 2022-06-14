import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class NetworkSmsAutoFill {
  Future<String> registrationSms(
      {required String userName,
        required String password,
        required String captchaKey,
        required String captchaValue,
        required String smsHash}) async {
    Response response;
    var dio = Dio();
    response = await dio.post("${MainUrl.mainUrls}/auth/register", data: {
      "username": userName,
      "password": password,
      "captcha_key": captchaKey,
      "captcha_val": captchaValue
      //, "sms_hash":smsHash
    });
    return jsonEncode(response.data);
  }

  ///
  Future<String> resetPasswordSms(
      {required String userName,
        required String captchaKey,
        required String captchaVal,
        required String smsHash}) async {
    Response response;
    var dio = Dio();
    log(userName);
    response = await dio

        .post("${MainUrl.mainUrls}/auth/request-password-reset", data: {
      "username": userName,
      "captcha_key": captchaKey,
      "captcha_val": captchaVal,
    });
    log(response.data.toString());
    return jsonEncode(response.data);
  }

  static Future<String> sentServerSms(
      {required String smsCode,
        required String smsId,
        required String appId}) async {

    var dio = Dio();
    Response response;
    log("sms_code: $smsCode, sms_id:$smsId");
    response = await dio.post("${MainUrl.mainUrls}/auth/check-sms",
        data: {"sms_code": smsCode, "sms_id": smsId, "app_id": "1"});

    return jsonEncode(response.data);
  }
}