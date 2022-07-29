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
  bool boolDownloadTexnikum = false;
  Future checkAllInfoUser() async {
    try {
      boolDownloadTexnikum = false;
      String data = await networkCheckUserInfoTexnikum.getUserInfoTexnikum(
          phoneNumber: "998489900");
      modelCheckUserInfoTexnikum =
          ModelCheckUserInfoTexnikum.fromJson(jsonDecode(data));
      boolDownloadTexnikum = true;
      notifyListeners();
    } catch (e) {}
  }



  Future checkInfo({required int index, required ProviderTexnikum providerTexnikum, required BuildContext context, required Function func })async{
    try{
      if(index == 0){}

    }catch(e){}
  }

}
