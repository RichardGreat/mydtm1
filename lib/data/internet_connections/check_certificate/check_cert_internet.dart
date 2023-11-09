import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class InternetCheckCert {
  Future<dynamic> getData({required String pnfl}) async {
    var dio = Dio();
    try {
      log("https://mandat.uzbmb.uz/API/GetCert?PNFL=$pnfl");
      Response response = await dio.get(
          "https://mandat.uzbmb.uz/API/GetCert?PNFL=$pnfl",
          options: Options(receiveTimeout: const Duration(seconds: 3)))
              // ignore: argument_type_not_assignable_to_error_handler, body_might_complete_normally_catch_error
              .catchError((DioException err) {
        // log(err.response.toString());
                if (err.response != null) {
                  log(err.response!.statusCode.toString());
                }

            if (CancelToken.isCancel(err)) {
              // print("Request canceled: ${err.message}");
            } else {
              // handle error.
            }
          });
          return jsonEncode(response.data).toString();
    } on DioException catch (e) {
      if (e.response != null) {
        // print(e.response!.data.toString());
        // print(e.response!.headers.toString());
        // print(e.response!.requestOptions.toString());
      } else {
        // log(e.response!.statusCode.toString());
        // print(e.requestOptions.toString());
        // print(e.message.toString());
      }
    }
  }
}
