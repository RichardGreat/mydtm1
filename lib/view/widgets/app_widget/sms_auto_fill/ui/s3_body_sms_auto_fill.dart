import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/state_menegment/provider_sms.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/ui/response_message.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/ui/s1_app_bar_sms.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/ui/s2_ui_text.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/ui/s4_botton_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SmsAutoFillUi extends StatefulWidget {
  String phoneNum;
  String password;
  String captchaKey;
  String captchaValue;
  String registration;

  /// agar registration 0 bo'lsa parol tiklash

  SmsAutoFillUi(
      {super.key,
      required this.phoneNum,
      required this.password,
      required this.captchaKey,
      required this.captchaValue,
      required this.registration});

  @override
  State<SmsAutoFillUi> createState() => _SmsAutoFillUiState();
}

class _SmsAutoFillUiState extends State<SmsAutoFillUi> {
  ProviderSms providerSms = ProviderSms();

  @override
  void initState() {
    log(widget.phoneNum.toString());
    log(widget.password.toString());
    log(widget.captchaKey.toString());
    log(widget.captchaValue.toString());
    log(widget.registration.toString());
    if (widget.registration != "99") {
      //   phoneNum:  box.get("phoneNumber"),
      // password: "",
      // captchaKey: modelResetPassSms.data.smsId.toString(),
      // captchaValue: modelResetPassSms.data.endDate.toString(),
      // registration: "2")

      providerSms.getSmsCode(
          context: context,
          captchaKey: widget.captchaKey,
          captchaValue: widget.captchaValue,
          password: widget.password,
          phoneNum: widget.phoneNum,
          numbers: int.parse(widget.registration));
    } else if (widget.registration == "99") {
      providerSms.regNotActivated(
          smsId: widget.captchaValue,
          endTime: int.parse(widget.captchaKey),
          context: context);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (providerSms.boolData) {
      providerSms.timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerSms,
      child: Consumer<ProviderSms>(
        builder: (context, value, child) => WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            appBar: appBarSms(context: context),
            body: !providerSms.boolData
                ? const Center(child: CupertinoActivityIndicator())
                : SafeArea(
                    child: !providerSms.boolRegistration
                        ? Container(
                            margin: const EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    uiText(
                                        context: context,
                                        phoneNum: widget.phoneNum,
                                        providerSms: providerSms),
                                    const SizedBox(height: 25),

                                    bottomUI(
                                        phoneNumber: widget.phoneNum,
                                        context: context,
                                        providerSms: providerSms)

                                    // Text(providerSms.valueSignature ?? ""),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : registrated(
                            context: context,
                            providerSms: providerSms,
                            message: providerSms.dataRegisSmsMessage)),
          ),
        ),
      ),
    );
  }
}
