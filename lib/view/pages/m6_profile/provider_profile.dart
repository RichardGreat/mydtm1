
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m6_profile/change_number.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_imie.dart';
import 'package:mydtm/data/model_parse/m6_model/get_imie_info.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:developer';

class ProviderProfile extends ChangeNotifier{

  TextEditingController textChangePhoneNum = TextEditingController();
  TextEditingController textChangePassword1 = TextEditingController();
  TextEditingController textChangePassword2 = TextEditingController();

  final formKeyChangePhone = GlobalKey<FormState>();
  final formKeyChangePassword = GlobalKey<FormState>();
  bool myBoolWidget = false;
  bool boolButtonColor1 = false;

  ///
  bool boolGetProfileData = false;
  late ModelGetImieInfo modelGetImieInfo;
  late DataGetImieInfo dataGetImieInfo;
  NetworkGetIMie networkGetIMie = NetworkGetIMie();
  var box = Hive.box("online");

  late String psser,
      psnum,
      imie,
      lname,
      fname,
      mname,
      bdate,
      sex,
      nationId,
      image;

  Future getProfile()async{
    try{
      boolGetProfileData = false;
      String dataInfo = await networkGetIMie.getIMieInformation();
      modelGetImieInfo = ModelGetImieInfo.fromJson(jsonDecode(dataInfo));
      dataGetImieInfo = modelGetImieInfo.data;
      psser = dataGetImieInfo.psser;
      psnum = dataGetImieInfo.psnum.toString();
      imie = dataGetImieInfo.imie.toString();
      lname = dataGetImieInfo.lname;
      fname = dataGetImieInfo.fname;
      mname = dataGetImieInfo.mname;
      bdate = dataGetImieInfo.bdate.toString();
      sex = dataGetImieInfo.sex.toString();
      nationId = dataGetImieInfo.nationId.toString();
      image = dataGetImieInfo.image;
      box.put("personImage", image);
      boolGetProfileData = true;
      notifyListeners();
    }catch(e){
      // no profile
      boolGetProfileData = true;
      notifyListeners();
    }
  }

  Future boolButtonCol1({required bool boolValue}) async {
    boolButtonColor1 = boolValue;
  }

  bool boolButtonColor2 = false;

  Future boolButtonCol2({required bool boolValue}) async {
    boolButtonColor2 = boolValue;
  }

  bool boolPasswordVisible = false;
  bool boolPasswordVisible2 = false;

  Future boolPasswordVisibleMethod() async {
    boolPasswordVisible = !boolPasswordVisible;
    notifyListeners();
  }
  Future boolPasswordVisibleMethod2() async {
    boolPasswordVisible2 = !boolPasswordVisible2;
    notifyListeners();
  }

  bool boolPasswordBtnColor = false;
  Future passwordButtonColor({required bool boolBtnCol})async{
    boolPasswordBtnColor = boolBtnCol;
    notifyListeners();
  }

  ///
  NetworkChangePhoneNumber networkChangePhoneNumber = NetworkChangePhoneNumber();

  Future changePhoneNumber()async{
      try{
        String data = await networkChangePhoneNumber.getChangePhoneNumber(phoneNumber: textChangePhoneNum.text);

        log(data);
      }catch(e){log(e.toString());}
  }

  ///
  Future goLoginPage({required BuildContext context})async{
    pushNewScreen(
      context,
      screen: const EnterFirst(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  Future logOut()async{
    
  }


  /// Change Phone




}
