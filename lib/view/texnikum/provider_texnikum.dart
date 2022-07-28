import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mydtm/data/texnikum/internet/check_info_user/check_user_texnikum.dart';
import 'package:mydtm/data/texnikum/models/user_check/model_user_check.dart';

class ProviderTexnikum extends ChangeNotifier {
  //  name: "personInformation".tr(),
  //   name: "addressAlways".tr(),
  //    name: "schoolInfo".tr(),
  //     name: "oldEdu".tr(),
  //      name: "chooseDirection".tr(),

  NetworkCheckUserInfoTexnikum networkCheckUserInfoTexnikum =
      NetworkCheckUserInfoTexnikum();
  late ModelCheckUserInfoTexnikum modelCheckUserInfoTexnikum;

  Future checkAllInfoUser() async {
    try {
      String data = await networkCheckUserInfoTexnikum.getUserInfoTexnikum(
          phoneNumber: "998489900");
      modelCheckUserInfoTexnikum =
          ModelCheckUserInfoTexnikum.fromJson(jsonDecode(data));
      notifyListeners();
    } catch (e) {}
  }
}
