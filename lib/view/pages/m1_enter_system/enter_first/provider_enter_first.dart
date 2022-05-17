import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:mydtm/data/internet_connections/m1_internet/authorize.dart';
import 'package:mydtm/data/internet_connections/m1_internet/get_captcha.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_auth_captcha_error.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_auth_error.dart';
import 'package:mydtm/data/model_parse/m1_model/authhorization/model_auth_success.dart';
import 'package:mydtm/data/model_parse/m1_model/parse_captche.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/sign_up.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

class ProviderEnterFirst extends ChangeNotifier {
  ///#offline App Logic
  bool boolPasswordVisible = false;
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

  Future enterPersonPassport({required BuildContext context}) async {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const PersonInformation(),
        ));
  }

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
  late ModelAuthorizationError modelAuthorizationError;
  late ModelAuthorizationCaptchaError modelAuthorizationCaptchaError;

  bool boolAuthorization = false;

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
    String data =
        await NetworkAuthorize.getAuthorize(mapAuthorize: getAuthorizationData);
    boolAuthorization = false;
    try{
      modelAuthorizationParse = ModelAuthorizationParse.fromJson(jsonDecode(data));

    }catch(e){
      try{
        modelAuthorizationError = ModelAuthorizationError.fromJson(jsonDecode(data));
        MyWidgets.scaffoldMessengerBottom(context: context, valueText: modelAuthorizationError.errors.password[0]);
      }catch(e){
        modelAuthorizationCaptchaError = ModelAuthorizationCaptchaError.fromJson(jsonDecode(data));
        MyWidgets.scaffoldMessengerBottom(context: context, valueText: modelAuthorizationCaptchaError.errors);
      }
    }


    log(jsonEncode(modelAuthorizationParse));
  }

  /// #1

}
