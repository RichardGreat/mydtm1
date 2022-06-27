import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m1_internet/get_captcha.dart';
import 'package:mydtm/data/internet_connections/m3_home/service_list.dart';
import 'package:mydtm/data/internet_connections/m6_profile/change_number.dart';
import 'package:mydtm/data/internet_connections/m6_profile/change_password.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_imie.dart';
import 'package:mydtm/data/internet_connections/m6_profile/sms_model_reset_pass.dart';
import 'package:mydtm/data/internet_connections/person_info/set_lang.dart';
import 'package:mydtm/data/model_parse/m1_model/parse_captche.dart';
import 'package:mydtm/data/model_parse/m6_model/change_phone/phone_changes.dart';
import 'package:mydtm/data/model_parse/m6_model/get_imie_info.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/ui/s3_body_sms_auto_fill.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:developer';

class ProviderProfile extends ChangeNotifier {
  TextEditingController textChangePhoneNum = TextEditingController();
  TextEditingController textPhoneChangePassport = TextEditingController();
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
  bool boolHasTokenNoImie = false;

  Future getProfile() async {
    try {
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
      boolHasTokenNoImie = false;
      boolGetProfileData = true;
      notifyListeners();
    } catch (e) {
      // no profile
      boolHasTokenNoImie = true;
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

  bool boolPasswordVisible = true;
  bool boolPasswordVisible2 = true;

  Future boolPasswordVisibleMethod() async {
    boolPasswordVisible = !boolPasswordVisible;
    notifyListeners();
  }

  Future boolPasswordVisibleMethod2() async {
    boolPasswordVisible2 = !boolPasswordVisible2;
    notifyListeners();
  }

  bool boolPasswordBtnColor = false;

  Future passwordButtonColor({required bool boolBtnCol}) async {
    boolPasswordBtnColor = boolBtnCol;
    notifyListeners();
  }

  ///
  NetworkChangePhoneNumber networkChangePhoneNumber =
      NetworkChangePhoneNumber();

  Future changePhoneNumber({required BuildContext context}) async {
    try {
      String data = await networkChangePhoneNumber.getChangePhoneNumber(
          phoneNumber: textChangePhoneNum.text);
      ModelPhoneChange modelPhoneChange =
          ModelPhoneChange.fromJson(jsonDecode(data));
      // ignore: use_build_context_synchronously
      pushNewScreen(context,
          screen: SmsAutoFillUi(
              phoneNum: modelPhoneChange.data.phone.toString(),
              password: "",
              captchaKey: modelPhoneChange.data.smsId.toString(),
              captchaValue: "",
              registration: "3"));
      textChangePhoneNum.clear();
      log(data);
    } catch (e) {
      log(e.toString());
    }
  }

  ///
  Future goLoginPage({required BuildContext context}) async {
    pushNewScreen(
      context,
      screen: const EnterFirst(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  Future logOut() async {}

  late ModelParseCaptcha modelParseCaptcha;
  TextEditingController textCaptchaEditingControllerPassport =
      TextEditingController();
  bool boolGetCaptcha = false;

  Future getCaptcha() async {
    try {
      boolGetCaptcha = false;
      modelParseCaptcha = await NetworkGetCaptcha.getCaptcha();
      boolGetCaptcha = true;
      notifyListeners();
    } catch (e) {
      /// error
    }
  }
  ///


 // MyColors myColors = MyColors();
  late NetworkServiceList networkServiceList = NetworkServiceList();
  NetworkSetLanguage networkSetLanguage = NetworkSetLanguage();
  String dataLang = "";
  Future setLangUser() async {
    try{
      if (box.get("token").toString().length > 30) {
        box.get("language") == "1"
            ? {
          dataLang =
          await networkSetLanguage.setLanguageUser(setLang: "uz")
        }
            : box.get("language") == "2"
            ? {
          dataLang =
          await networkSetLanguage.setLanguageUser(setLang: "kk")
        }
            : {
          dataLang =
          await networkSetLanguage.setLanguageUser(setLang: "ru")
        };
        log(dataLang);
      }
    }catch(e){
      log(e.toString());
    }
  }


///
  NetworkChangePassword networkChangePassword = NetworkChangePassword();

  Future getNewPassport({required BuildContext context}) async {
    try {
      Map<String, dynamic> mapForNewPassword = {
        "username": box.get("phoneNumber"),
        "captcha_key": modelParseCaptcha.data.captchaKey,
        "captcha_val": textCaptchaEditingControllerPassport.text,
      };
      getCaptcha();
      String dataNet = await networkChangePassword.getChangePhoneNumber(
          mapChangePassword: mapForNewPassword);
      ModelResetPassSms modelResetPassSms = ModelResetPassSms.fromJson(jsonDecode(dataNet));
      textCaptchaEditingControllerPassport.clear();

      // ignore: use_build_context_synchronously
      pushNewScreen(context,
          screen: SmsAutoFillUi(
              phoneNum:  box.get("phoneNumber"),
              password: "",
              captchaKey: modelResetPassSms.data.smsId.toString(),
              captchaValue: modelResetPassSms.data.endDate.toString(),
              registration: "2"));
    } catch (e) {
      log(e.toString());
    }
  }

  /// Change Phone

}
