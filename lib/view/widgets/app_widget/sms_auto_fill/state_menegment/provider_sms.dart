// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m1_internet/get_token.dart';
import 'package:mydtm/data/internet_connections/m1_internet/registration.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_auth_success.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_get_token.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m4_arizalar/main_my_statement.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/change_passport/change_password_in/change_password_input.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/edu/edu_reg_success.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_auth.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_captcha_error.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_phonechange_saved.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_registrated.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_reset_password2.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_sms.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_sms_not_match.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/networks/network_sms.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:mydtm/view/widgets/save_hive.dart';

class ProviderSms extends ChangeNotifier {
  final scaffoldKey = GlobalKey();
  TextEditingController textEditingControllerSms = TextEditingController();
  String? valueSignature;
  String variantId = "0";
  bool boolTimeEnd = false;
  late Duration time1;
  late Timer timer;
  int timeCount = 0;
  int totalCount = 300;
  String? timeFormatString;
  bool boolData = false;
  dynamic smsId;

  /// Registratiya

  late ModelRegistrationHave modelRegistrationHave;
  late ModelRegistrationCaptchaError modelRegistrationCaptchaError;
  NetworkSmsAutoFill networkSmsAutoFill = NetworkSmsAutoFill();
  bool boolRegistration = false;
  late String dataSms;
  late String dataRegisSmsMessage;

  Future downloadRegistrationData({
    required BuildContext context,
    required String userName,
    required String password,
    required String captchaValue,
    required String captchaKey,
  }) async {
    boolData = false;
    if (valueSignature != null) {
      dataSms = await networkSmsAutoFill.registrationSms(
          userName: userName,
          password: password,
          captchaValue: captchaValue,
          captchaKey: captchaKey,
          smsHash: valueSignature!);
    } else {
      dataSms = await networkSmsAutoFill.registrationSms(
          userName: userName,
          password: password,
          captchaValue: captchaValue,
          captchaKey: captchaKey,
          smsHash: "a76892");
    }
    try {
      ModelRegistrationSms modelRegistrationSms =
          ModelRegistrationSms.fromJson(jsonDecode(dataSms));
      box.delete("phoneNumber");
      box.put("phoneNumber", userName);
      if (modelRegistrationSms.status == 1) {
        boolRegistration = false;
        smsId = modelRegistrationSms.data.smsId.toString();
        smsTimer(timers: modelRegistrationSms.data.endDate, context: context);
        boolData = true;
        notifyListeners();
      }
    } catch (e) {
      try {
        boolRegistration = true;
        modelRegistrationHave =
            ModelRegistrationHave.fromJson(jsonDecode(dataSms));
        dataRegisSmsMessage = modelRegistrationHave.errors.username[0];
        boolData = true;
        notifyListeners();

        /// ro'yxatdan o'tgan polzovitl
      } catch (e) {
        /// Captchada xato

        modelRegistrationCaptchaError =
            ModelRegistrationCaptchaError.fromJson(jsonDecode(dataSms));
        MyWidgets.scaffoldMessengerBottom(
            context: context, valueText: "captchaError".tr());
        Navigator.of(context).pop();

        log("catch");
        log(e.toString());
      }
    }
  }

  /// registratsiya
  Future sendRegistrationServer(
      {required String smsCode,
      required String smsId,
      required BuildContext context}) async {
    Map<String, String> mapRegistration = {
      "sms_code": smsCode,
      "sms_id": smsId,
      "app_id": "1",
    };
    try {
      boolSentServerRequest = false;
      notifyListeners();
      String data = await NetworkRegistration.getRegistration(
          mapRegistration: mapRegistration);
      ModelAuthorizationParse modelAuthorizationParse =
          ModelAuthorizationParse.fromJson(jsonDecode(data));
      String dataToken = await NetworkGetToken.getTokenModel(
          authCode: modelAuthorizationParse.data.authorizationCode);
      ModelGetToken modelGetToken =
          ModelGetToken.fromJson(jsonDecode(dataToken));
      box.delete("token");
      box.put("token", modelGetToken.data.accessToken);
      var person = Person()..token= modelGetToken.data.accessToken.toString();
      box.add(person);
      box.delete("langLock");
      box.put("langLock", "1");
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) =>  MainPages(homeIdMainpage: "1"),
          ),
          (route) => false);
      log(data);
    } catch (e) {
      boolSentServerRequest = true;
      notifyListeners();
    }
  }

  late String dataResetPassword;

  //   phoneNum:  box.get("phoneNumber"),
  // password: "",
  // captchaKey: modelResetPassSms.data.smsId.toString(),
  // captchaValue: modelResetPassSms.data.endDate.toString(),
  // registration: "2")
  Future resetPassword(
      {required String userName,
      required String captchaKey,
      required String captchaVal,
      required BuildContext context}) async {
    boolData = true;
    notifyListeners();

    try {

    dataResetPassword = await networkSmsAutoFill.resetPasswordSms(
        userName: userName,
        captchaKey: captchaKey,
        captchaVal: captchaVal,
        smsHash: "");
        ModelRegistrationSms modelRegistrationSms12 =
        ModelRegistrationSms.fromJson(jsonDecode(dataResetPassword));
    smsId = modelRegistrationSms12.data.smsId.toString();
      boolData = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
    boolData = true;
    smsTimer(context: context, timers: int.parse(captchaValues));
    // boolData = false;
    notifyListeners();
  }

  String dataSmsResetPassword = "";
  late ModelSmsNotMatch modelSmsNotMatch;

  Future getResetPass(
      {required String smsCode,
      required String phoneNum,
      required BuildContext context,
      required String smsId}) async {
    try {
      boolSentServerRequest = false;

      boolData = false;
      notifyListeners();
      log("getResetPass");
      log(smsId.toString());
      log(smsCode.toString());

      dataSmsResetPassword = await NetworkSmsAutoFill.sentServerSms(
          smsId: smsId, appId: "1", smsCode: smsCode);

      ModelResetPassToken2 modelResetPassToken2 =
          ModelResetPassToken2.fromJson(jsonDecode(dataSmsResetPassword));
      Navigator.push(context,CupertinoPageRoute(builder: (context) => ChangePasswordInput(
          phoneNumber: phoneNum,
          passResetToken: modelResetPassToken2.data.passwordResetToken)));
      boolData = true;
      timer.cancel();
      boolSentServerRequest = true;
      notifyListeners();
    } catch (e) {
      try {
        boolData = true;
        timer.cancel();
        boolSentServerRequest = true;
        modelSmsNotMatch =
            ModelSmsNotMatch.fromJson(jsonDecode(dataSmsResetPassword));

        AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.bottomSlide,
                title: "BBA",
                desc: "infoFillError".tr(),
                titleTextStyle: TextStyle(
                    color: MyColors.appColorBlue1(),
                    fontWeight: FontWeight.bold),
                descTextStyle: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.bold),
                btnCancelOnPress: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                btnCancelColor: MyColors.appColorBlue1(),
                btnCancelText: "OK")
            .show();
        notifyListeners();
      } catch (e) {
        boolData = true;
        timer.cancel();
        boolSentServerRequest = true;
        notifyListeners();
      }
    }
  }

  /// Change phone
  Future changePhone(
      {required String userName,
      required String smsHash,
      required BuildContext context}) async {
    boolData = true;
    try {
      smsTimer(timers: 180, context: context);
    } catch (e) {
      log(e.toString());
      boolData = false;
      notifyListeners();
    }
  }

  Future changePhoneNumber(
      {required String phoneNum,
      required String smsId,
      required String smsCode,
      required BuildContext context}) async {
    boolData = false;
    try {
      boolSentServerRequest = false;
      notifyListeners();
      Map<String, dynamic> mapPhoneChange = {
        "sms_id": smsId,
        "sms_code": smsCode,
        "phone": phoneNum,
      };
      String dataChangePhone = await networkSmsAutoFill.changePhoneNumber(
          mapChangePhone: mapPhoneChange);

      ModelPhoneChangeSaved modelPhoneChangeSaved =
          ModelPhoneChangeSaved.fromJson(jsonDecode(dataChangePhone));

      log(dataChangePhone);
      boolData = true;
      if (modelPhoneChangeSaved.status == 1) {
        box.delete("phoneNumber");
        box.put("phoneNumber", phoneNum);
        AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.bottomSlide,
                title: "BBA",
                desc: "saved".tr(),
                titleTextStyle: TextStyle(
                    color: MyColors.appColorBlue1(),
                    fontWeight: FontWeight.bold),
                descTextStyle: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.bold),
                btnCancelOnPress: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                btnCancelColor: MyColors.appColorBlue1(),
                btnCancelText: "OK")
            .show();
      }
      notifyListeners();
      boolSentServerRequest = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      boolData = true;
      AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.bottomSlide,
              title: "BBA",
              desc: "reTry".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
              btnCancelOnPress: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              btnCancelText: "OK")
          .show();
      boolSentServerRequest = true;
      notifyListeners();
    }
  }

  Future sendServerALLEdu(
      {required String userName,
      required String smsHash,
      required BuildContext context}) async {}

  /// Timer
  /// Begin
  Future timeFormat({required int totalCount, required int timeCount}) async {
    String hh;
    String mm;
    String ss;
    if (timeCount <= 0) {
      timer.cancel();
    }
    ss = (timeCount % 60).toStringAsFixed(0);
    mm = ((timeCount ~/ 60) % 60).toStringAsFixed(0);
    hh = ((timeCount ~/ 3600).toStringAsFixed(0));
    hh = hh.length < 2 ? ("0$hh").substring(0, 2) : "00";
    mm = mm.length < 2 ? ("0$mm").substring(0, 2) : ("0$mm").substring(1, 3);
    ss = ss.length < 2 ? ("0$ss").substring(0, 2) : ("0$ss").substring(1, 3);
    timeFormatString = "$mm:$ss";
  }

  int smsTimer({required int timers, required BuildContext context}) {
    timeCount = timers;
    timer = Timer.periodic(const Duration(seconds: 1), (timer1) {
      timeCount = timeCount - 1;
      if (timeCount == 0) {
        endTime();
      }
      timeFormat(totalCount: totalCount, timeCount: timeCount);
      notifyListeners();
    });

    return timeCount;
  }

  Future endTime() async {}

  /// Begin

  /// registratsiya qilgan sms activate qilmagan
  String smsIdActivate = "";

  Future regNotActivated(
      {required String smsId,
      required int endTime,
      required BuildContext context}) async {
    boolRegistration = false;
    smsIdActivate = smsId;
    smsTimer(timers: endTime, context: context);
    boolData = true;
    notifyListeners();
  }

  var box = Hive.box("online");

  Future sentServer(
      {required BuildContext context,
      required String appId,
      required String smsCode}) async {
    try {
      String data = await NetworkSmsAutoFill.sentServerSms(
          smsCode: smsCode, smsId: smsId, appId: "1");
      try {
        ModelAuthSms modelAuthSms = ModelAuthSms.fromJson(jsonDecode(data));
        String token = await NetworkGetToken.getTokenModel(
            authCode: modelAuthSms.data.authorizationCode);
        ModelGetToken modelGetToken = ModelGetToken.fromJson(jsonDecode(token));

        box.put("token", modelGetToken.data.accessToken);
        var person = Person()..token= modelGetToken.data.accessToken.toString();
        box.add(person);
        log(box.get("token"));
        if (box.get("token").toString().length > 30) {
          box.delete("phoneNumber");
          box.put("phoneNumber", phoneNumber);
          box.delete("langLock");
          box.put("langLock", "1");
          Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                builder: (context) =>  MainPages(homeIdMainpage: "0"),
              ),
              (route) => false);
        }
      } catch (e) {throw Exception(e.toString());}

      log(data);
      log(smsCode);
      log(smsId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  String resiviedSms = '';
  String smsIds = '';
  String logId = '';

  bool boolSentServerRequest = true;

  Future sentServer2Edu({required BuildContext context}) async {
    boolSentServerRequest = false;
    notifyListeners();
    try {
      String data = await networkSmsAutoFill.sentServer2Edu(
          resiviedSms: textEditingControllerSms.text,
          smsId: smsId7.toString(),
          logId: logId7.toString());
      log(data);
      ModelEduSuccess modelEduSuccess =
          ModelEduSuccess.fromJson(jsonDecode(data));

      if (modelEduSuccess.status == 1) {
        // ProviderAriza providerAriza = ProviderAriza();
        Navigator.push(context,CupertinoPageRoute(builder: (context) => MainMyStatement(
          numberParam: "2",
        )));

      } else {
        MyWidgets.awesomeDialogError(
            context: context, valueText: "infoFillError".tr());
        Navigator.of(context).pop();
      }
      boolSentServerRequest = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      boolSentServerRequest = true;
      notifyListeners();
    }
  }

  String phoneNumber = "";
  String logId7 = "";
  String smsId7 = "";
  int smsSentStatus = 0;

  String numberPhones = "";
  String passwords = "";
  String captchaKeys = "";
  String captchaValues = "";

  Future getSmsCode(
      {required BuildContext context,
      required int numbers,
      required String phoneNum,
      required String password,
      required String captchaKey,
      required String captchaValue}) async {
    //   phoneNum:  box.get("phoneNumber"),
    // password: "",
    // captchaKey: modelResetPassSms.data.smsId.toString(),
    // captchaValue: modelResetPassSms.data.endDate.toString(),
    // registration: "2")
    numberPhones = phoneNum;
    passwords = password;
    captchaKeys = captchaKey;
    captchaValues = captchaValue;
    smsSentStatus = numbers;

    if (numbers == 1) {
      /// registratsiya
      phoneNumber = phoneNum;
      downloadRegistrationData(
        context: context,
        userName: phoneNum,
        password: password,
        captchaKey: captchaKey,
        captchaValue: captchaValue,
      );
    } else if (numbers == 2) {
      /// parol tiklash
      boolData = true;
      smsTimer(context: context, timers: int.parse(captchaValues));
      // resetPassword(
      //     userName: phoneNum,
      //     captchaVal: captchaValue,
      //     captchaKey: captchaKey,
      //     context: context);
    }

    /// Telefon nomer almashtirish

    else if (numbers == 3) {
      changePhone(
          userName: phoneNum,
          smsHash: valueSignature.toString(),
          context: context);

      /// OTM ro'yxatdan o'tish
    } else if (numbers == 7) {
      boolData = true;
      notifyListeners();
      smsSentStatus = numbers;
      logId7 = captchaKey;
      smsId7 = captchaValue;
      smsTimer(timers: 180, context: context);
      boolData = true;
      notifyListeners();
      log("7");
      // SmsAutoFillUi(phoneNum: modelSms2.data.phone,
      //     password: "",
      //     captchaKey: modelSms2.data.logId.toString(),
      //     captchaValue: modelSms2.data.smsId.toString(),
      //     registration: 7)
    }
  }

// Future getOTPCode() async {
//
// try{
//   controller = OTPTextEditController(
//       codeLength: 5,
//       onCodeReceive: (code) => {
//         code1 = code,
//         log('Your Application receive code - $code'),
//       })
//     ..startListenUserConsent(
//           (code) {
//         final exp = RegExp(r'(\d{5})');
//         return exp.stringMatch(code ?? '') ?? '';
//       },
//       strategies: [
//         // SampleStrategy(),
//       ],
//     );
// }catch(e){}
//
// }

  ///end
}
