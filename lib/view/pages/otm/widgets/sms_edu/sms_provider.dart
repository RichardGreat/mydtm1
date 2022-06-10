import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ProviderSmsEdu extends  ChangeNotifier {
  late TextEditingController controller = TextEditingController();

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

  bool boolRegistration = false;
  late String dataSms;
  late String dataRegisSmsMessage;




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



  var box = Hive.box("online");
  String resiviedSms= '';
  String smsIds = '';
  String logId= '';

  Future sentServer2Edu({required BuildContext context})async  {

    String data = await networkSmsAutoFill  .sentServer2Edu(resiviedSms: controller.text, smsId: smsId7, logId: logId7);
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

    } else if (numbers == 2) {
      /// parol tiklash

    }

    /// Telefon nomer almashtirish

    else if (numbers == 3) {

    }else if(numbers == 7){
      boolData = true;
      notifyListeners();
      smsSentStatus = numbers;
      logId7 = captchaKey;
      smsId7 = captchaValue;
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
