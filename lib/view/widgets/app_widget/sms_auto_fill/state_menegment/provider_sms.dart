import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m1_internet/get_token.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_get_token.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m4_arizalar/main_my_statement.dart';
import 'package:mydtm/view/pages/otm/widgets/edu_reg_success/success_edu_reg.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/edu/edu_reg_success.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_auth.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_captcha_error.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_registrated.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_sms.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/networks/network_sms.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProviderSms extends ChangeNotifier {
  late OTPTextEditController controller = OTPTextEditController(codeLength: 5);

  final scaffoldKey = GlobalKey();
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
    log(valueSignature!);
    if (valueSignature != null) {
      dataSms = await networkSmsAutoFill.registrationSms(
          userName: userName,
          password: password,
          captchaValue: captchaValue,
          captchaKey: captchaKey,
          smsHash: valueSignature!);
    } else {
      // dataSms = await networkSmsAutoFill.registrationSms(
      //     userName: userName,
      //     password: password,
      //     captchaValue: captchaValue,
      //     captchaKey: captchaKey,
      //     smsHash: "76892");
    }
    try {
      ModelRegistrationSms modelRegistrationSms =
          ModelRegistrationSms.fromJson(jsonDecode(dataSms));
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
        MyWidgets.scaffoldMessengerBottom(context: context, valueText: modelRegistrationCaptchaError.errors);
          Navigator.of(context).pop();

        log("catch");
        log(e.toString());
      }
    }
  }

  late String dataResetPassword;

  Future resetPassword(
      {required String userName,
      required String captchaKey,
      required String captchaVal,
      required BuildContext context}) async {
    boolData = false;
    try {
      if (valueSignature != null) {
        ///
        dataResetPassword = await networkSmsAutoFill.resetPasswordSms(
            userName: userName,
            captchaKey: captchaKey,
            captchaVal: captchaVal,
            smsHash: valueSignature!);

        ModelRegistrationSms modelRegistrationSms =
            ModelRegistrationSms.fromJson(jsonDecode(dataResetPassword));

        smsTimer(timers: modelRegistrationSms.data.endDate, context: context);
        ModelRegistrationSms modelRegistrationSms12 =
            ModelRegistrationSms.fromJson(jsonDecode(dataResetPassword));
        smsId = modelRegistrationSms12.data.smsId.toString();

      } else {
        log(code1);
      }
      boolData = true;

      ///
      /// Navigator.push(context, CupertinoPageRoute(builder: (context) => const NewPassword(),));
      ///
      log("#3");
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
    boolData = true;
    notifyListeners();
  }


  Future changePhone(
      {required String userName,
      required String smsHash,
      required BuildContext context}) async {
    boolData = false;
    try {
      // NetworkChangePhone networkChangePhone = NetworkChangePhone();
      // String data = await networkChangePhone.getContact(
      //     userName: userName, smsHash: smsHash);
      // log(data);
      // ModelRegistrationSms modelRegistrationSms =
      //     ModelRegistrationSms.fromJson(jsonDecode(data));
      // smsId = modelRegistrationSms.data.username.toString();
      // // log(data);
      // boolData = true;
      // notifyListeners();
    } catch (e) {
      log(e.toString());
      boolData = true;
      notifyListeners();
    }
  }

  Future sendServerALLEdu( {
    required String userName,
    required String smsHash,
    required BuildContext context})async{

  }

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
    mm =
        mm.length < 2 ? ("0$mm").substring(0, 2) : ("0$mm").substring(1, 3);
    ss =
        ss.length < 2 ? ("0$ss").substring(0, 2) : ("0$ss").substring(1, 3);
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

  /// end;

  /// Begin
  late String code1;
/// registratsiya qilgan sms activate qilmagan
  String smsIdActivate = "";

  Future regNotActivated({
  required String smsId,
  required int endTime,
    required BuildContext context
})async  {
    boolRegistration = false;
    smsIdActivate = smsId;
    smsTimer(timers: endTime, context: context);
    boolData = true;
    notifyListeners();
  }


  var box = Hive.box("online");
  Future sentServer({required BuildContext context, required String appId, required String smsCode})async{
    try{

      String data = await NetworkSmsAutoFill.sentServerSms(smsCode: smsCode, smsId: smsId, appId: "1");
      try{
        ModelAuthSms modelAuthSms = ModelAuthSms.fromJson(jsonDecode(data));
            String token = await NetworkGetToken.getTokenModel(
            authCode: modelAuthSms.data.authorizationCode);
        ModelGetToken modelGetToken = ModelGetToken.fromJson(jsonDecode(token));

        box.put("token", modelGetToken.data.accessToken);
        log(box.get("token"));
        if (box
            .get("token")
            .toString()
            .length > 30) {
          // ignore: use_build_context_synchronously
          box.delete("phoneNumber");
          box.put("phoneNumber", phoneNumber);
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                builder: (context) => const MainPages(),
              ), (route) => false);
        }
      }catch(e){}

      log(data);
      log(smsCode);
      log(smsId);
    }catch(e){}
  }
  String resiviedSms= '';
  String smsIds = '';
  String logId= '';

  Future  sentServer2Edu({required BuildContext context})async  {
    log("resivied_sms: ${controller.text.toString()}, sms_id:$smsId7, logId:$logId7");
    String data = await networkSmsAutoFill.sentServer2Edu(resiviedSms: controller.text, smsId: smsId7.toString(), logId: logId7.toString());
    ModelEduSuccess modelEduSuccess = ModelEduSuccess.fromJson(jsonDecode(data));
    if (modelEduSuccess.status == 1) {
      // ignore: use_build_context_synchronously
      pushNewScreen(context, screen: MainMyStatement());
    } else {
      MyWidgets.awesomeDialogError(
          context: context,
          valueText: "Ma'lumot kiritishda xatolik qayta urinib ko'ring ");
      Navigator.of(context).pop();
    }

    log(controller.text);
    log(smsId7);
    log(logId7);
    log(data);
  }
  String phoneNumber = "";
  String logId7 ="";
  String smsId7 ="";
  int smsSentStatus = 0;
  // SmsAutoFillUi(phoneNum: modelSms2.data.phone,
  //     password: "",
  //     captchaKey: modelSms2.data.logId.toString(),
  //     captchaValue: modelSms2.data.smsId.toString(),
  //     registration: 7)


  Future getSmsCode(
      {required BuildContext context,
      required int numbers,
      required String phoneNum,
      required String password,
      required String captchaKey,
      required String captchaValue}) async {

    OTPInteractor otpInteract = OTPInteractor();
    valueSignature = await otpInteract.getAppSignature();
    code1 = valueSignature!;
    controller = OTPTextEditController(
        codeLength: 5,
        onCodeReceive: (code) => {
              code1 = code,
              log('Your Application receive code - $code'),
            })
      ..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{5})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [
          // SampleStrategy(),
        ],
      );

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
      resetPassword(
          userName: phoneNum,
          captchaVal: captchaValue,
          captchaKey: captchaKey,
          context: context);
    }

    /// Telefon nomer almashtirish

    else if (numbers == 3) {
      changePhone(
          userName: phoneNum,
          smsHash: valueSignature.toString(),
          context: context);

      /// OTM ro'yxatdan o'tish
    }else if(numbers == 7){
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
  ///end
}
