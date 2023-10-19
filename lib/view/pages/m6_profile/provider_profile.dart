// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:mydtm/main.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/ui/s3_body_sms_auto_fill.dart';
import 'package:url_launcher/url_launcher.dart';

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

  bool boolLockAction = false;

  Future getButtonAction() async {
    boolLockAction = !boolLockAction;
    notifyListeners();
  }

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
      if (box.get("boxAllPersonInfo").toString().length > 200) {
        modelGetImieInfo = ModelGetImieInfo.fromJson(
            jsonDecode(box.get("boxAllPersonInfo").toString()));
      } else {
        String dataInfo = await networkGetIMie.getIMieInformation();
        box.delete("boxAllPersonInfo");
        box.put("boxAllPersonInfo", dataInfo);
        modelGetImieInfo = ModelGetImieInfo.fromJson(jsonDecode(dataInfo));
        // dataGetImieInfo = modelGetImieInfo.data;
        // psnum = dataGetImieInfo.psnum.toString();
        // imie = dataGetImieInfo.imie.toString();
        // image = dataGetImieInfo.image;
        //
        // box.delete("imie");
        // box.delete("psnum");
        // box.delete("personImage");
        // box.put("imie", imie);
        // box.put("psnum", psnum);
        // box.put("personImage", image);
      }

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
      box.delete("imie");
      box.delete("psnum");
      box.delete("personImage");
      box.delete("fio");
      box.put("fio", "$lname $fname $mname");
      box.put("imie", imie);
      box.put("psnum", psnum);
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
      Navigator.push(context, CupertinoPageRoute(builder: (context) => SmsAutoFillUi(
          phoneNum: modelPhoneChange.data.phone.toString(),
          password: "",
          captchaKey: modelPhoneChange.data.smsId.toString(),
          captchaValue: "",
          registration: "3")));

      textChangePhoneNum.clear();
      log(data);
    } catch (e) {
      MyWidgets.awesomeDialogError(
          context: context, valueText: "telephoneHasNum".tr());
      log(e.toString());
    }
  }

  ///
  Future goLoginPage({required BuildContext context}) async {
    Navigator.push(context, CupertinoPageRoute(builder: (context) =>  EnterFirst(windowIdEnterFirst: "0"),));
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
    try {
      if (box.get("token").toString().length > 30) {
        box.get("language") == "1"
            ? {
                dataLang =
                    await networkSetLanguage.setLanguageUser(setLang: "uz"),
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
    } catch (e) {
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
      log(modelParseCaptcha.data.captchaKey);
      log(textCaptchaEditingControllerPassport.text);
      // getCaptcha();
      String dataNet = await networkChangePassword.getChangePhoneNumber(
          mapChangePassword: mapForNewPassword);
      ModelResetPassSms modelResetPassSms =
          ModelResetPassSms.fromJson(jsonDecode(dataNet));
      textCaptchaEditingControllerPassport.clear();

      Navigator.push(context, CupertinoPageRoute(builder: (context) =>  SmsAutoFillUi(
          phoneNum: box.get("phoneNumber"),
          password: "",
          captchaKey: modelResetPassSms.data.smsId.toString(),
          captchaValue: modelResetPassSms.data.endDate.toString(),
          registration: "2")));

    } catch (e) {
      log(e.toString());
    }
  }

  /// Change Phone
  final Uri url = Uri.parse("https://lex.uz/docs/-4396419");

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future changeLang(
      {required String langId, required BuildContext context}) async {
    if (langId == "0") {
      context.setLocale(const Locale('uz', 'UZ'));
      box.delete("language");
      box.put("language", "1");
      box.delete("langLock");
      box.put("langLock", "1");
      await setLangUser();
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => const MyApp()),
          (route) => false);
    } else if (langId == "1") {
      context.setLocale(const Locale('kk', 'KK'));
      box.delete("language");
      box.put("language", "2");
      box.delete("langLock");
      box.put("langLock", "1");
      await setLangUser();
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => const MyApp()),
          (route) => false);
    } else if (langId == "2") {
      context.setLocale(const Locale('ru', 'RU'));
      box.delete("language");
      box.put("language", "3");
      box.delete("langLock");
      box.put("langLock", "1");
      await setLangUser();
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => const MyApp()),
          (route) => false);
    }
  }

  final Uri urlDeleteAccount =
      Uri.parse("https://my.uzbmb.uz/site/delete-account");

  Future<void> launchDeleteAccountInBrowser() async {
    if (!await launchUrl(
      urlDeleteAccount,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
