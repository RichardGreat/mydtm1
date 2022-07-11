import 'package:easy_localization/easy_localization.dart';
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:developer';
import 'package:mydtm/data/internet_connections/m6_profile/change_password.dart';
import 'package:mydtm/data/model_parse/m6_model/change_password/model_new_get_tokens.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ProviderChangePasswordInputs extends ChangeNotifier {

  TextEditingController textEditingPass1 = TextEditingController();
  TextEditingController textEditingPass2 = TextEditingController();
  final formKeyChangeNewInputPassword = GlobalKey<FormState>();
  bool boolButtonColor1 = false;

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

  }


  late DataAccessNewPassport  dataAccessNewPassport;
  var box = Hive.box("online");

  Future getNewPassport(
      {required String passportResetToken,
      required String textNewPassport,
      required BuildContext context
      }) async {

    try {
      String data = await NetworkChangePassword.newPassport(resToken: passportResetToken, passport: textNewPassport);
      ModelAccessNewPassport modelAccessNewPassport = ModelAccessNewPassport.fromJson(jsonDecode(data));
      dataAccessNewPassport = modelAccessNewPassport.data;
      box.delete("token");
      box.put("token", dataAccessNewPassport.accessToken);
      AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.BOTTOMSLIDE,
          title: "DTM",
          desc: "passwordChange".tr(),
          titleTextStyle: TextStyle(
              color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
          descTextStyle: TextStyle(
              color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),

          btnCancelOnPress: () {
            box.delete("langLock");
            box.put("langLock", "1");
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainPages(),), (route) => false);
          },
          btnCancelColor: MyColors.appColorBlue1(),

          btnCancelText: "OK")
          .show();

    } catch (e) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.BOTTOMSLIDE,
          title: "DTM",
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
      log(e.toString());
    }
  }
}
