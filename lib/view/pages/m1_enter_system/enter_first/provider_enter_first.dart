import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m1_internet/authorize.dart';
import 'package:mydtm/data/internet_connections/m1_internet/get_captcha.dart';
import 'package:mydtm/data/internet_connections/m1_internet/get_token.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_auth_token.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_auth_captcha_error.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_auth_error.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_auth_success.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_get_token.dart';
import 'package:mydtm/data/model_parse/m1_model/parse_captche.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/sign_up.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/model/model_sms.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/ui/s3_body_sms_auto_fill.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProviderEnterFirst extends ChangeNotifier {
  ///#offline App Logic
  bool boolPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
  bool myBoolWidget = false;
  bool boolButtonColor1 = false;
  TextEditingController textAuthLogin = TextEditingController();
  TextEditingController textAuthPassword = TextEditingController();

  Future boolButtonCol1({required bool boolValue}) async {
    boolButtonColor1 = boolValue;
  }

  Future boolPasswordVisibleMethod() async {
    boolPasswordVisible = !boolPasswordVisible;
    notifyListeners();
  }

  Future enterSignUp({required BuildContext context}) async {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const SignUp(),
        ));
  }

  // Future enterPersonPassport({required BuildContext context}) async {
  //
  //
  //   Navigator.push(
  //       context,
  //       CupertinoPageRoute(
  //         builder: (context) => PersonInformation(),
  //       ));
  // }

  /// #offline

  /// App with internet

  /// #0 captcha
  late ModelParseCaptcha modelParseCaptcha;
  TextEditingController textCaptchaEditingController = TextEditingController();
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

  /// #0

  /// #1 Authorization
  late ModelAuthorizationParse modelAuthorizationParse;
  late ModelErrorUserName modelAuthorizationError;
  late ModelAuthorizationCaptchaError modelAuthorizationCaptchaError;

  bool boolAuthorization = false;

  ///
  var box = Hive.box("online");

  Future getAuthorization({required BuildContext context}) async {
    boolAuthorization = false;
    Map<String, String> getAuthorizationData = {
      "username": textAuthLogin.text,
      "password": textAuthPassword.text,
      "captcha_key": modelParseCaptcha.data.captchaKey,
      "captcha_val": textCaptchaEditingController.text,
      "app_id": "1"
    };
    getCaptcha();
    boolAuthorization = true;
    notifyListeners();
    String data =
    await NetworkAuthorize.getAuthorize(mapAuthorize: getAuthorizationData);
  log(data);
    try {
      ModelUserToken modelUserToken = ModelUserToken.fromJson(jsonDecode(data));
      String token = await NetworkGetToken.getTokenModel(
          authCode: modelUserToken.data.authorizationCode);
      ModelGetToken modelGetToken = ModelGetToken.fromJson(jsonDecode(token));

      box.put("token", modelGetToken.data.accessToken);
      log(box.get("token"));
      if (box
          .get("token")
          .toString()
          .length > 30) {
        // ignore: use_build_context_synchronously
        box.delete("phoneNumber");
        box.put("phoneNumber", textAuthLogin.text);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
              builder: (context) => const MainPages(),
            ), (route) => false);
      }
      boolAuthorization = false;
      modelAuthorizationParse =
          ModelAuthorizationParse.fromJson(jsonDecode(data));
    } catch (e) {
      try {
        boolAuthorization = false;
        modelAuthorizationError =
            ModelErrorUserName.fromJson(jsonDecode(data));
        MyWidgets.scaffoldMessengerBottom(
            context: context,
            valueText: modelAuthorizationError.errors.password[0]);
      } catch (e) {
        try {
          boolAuthorization = false;
          modelAuthorizationCaptchaError =
              ModelAuthorizationCaptchaError.fromJson(jsonDecode(data));
          MyWidgets.scaffoldMessengerBottom(
              context: context,
              valueText: modelAuthorizationCaptchaError.errors);
        } catch (e) {
          // smsId: widget.captchaValue, endTime: int.parse(widget.captchaKey), context: context);
          ModelRegistrationSms modelRegistrationSms = ModelRegistrationSms.fromJson(jsonDecode(data));

            log(data);
            log("::");

          // ignore: use_build_context_synchronously
          pushNewScreen(context, screen: SmsAutoFillUi(
              phoneNum: textAuthLogin.text,
              password: textAuthPassword.text,
              captchaKey: modelRegistrationSms.data.endDate.toString(),
              captchaValue: modelRegistrationSms.data.smsId.toString(),
              registration: "99"));
        }
      }
    }
    notifyListeners();
  }

/// #1

}
