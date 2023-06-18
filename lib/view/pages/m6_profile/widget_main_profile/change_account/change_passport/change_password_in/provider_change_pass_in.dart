// ignore_for_file: use_build_context_synchronously

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
  final formKeyChangeNewInputPassword = GlobalKey<FormState>();

  /// parol parametri mos bo'lish bo'lmasligi
  bool boolAccessNewPassword = false;

  Future boolGetAccessTypePassword({required bool boolValue}) async {
    boolAccessNewPassword = boolValue;
  }

  /// parolni ko'rsatish  yoki yashirish
  bool boolPasswordVisible = true;

  Future boolPasswordVisibleMethod() async {
    boolPasswordVisible = !boolPasswordVisible;
    notifyListeners();
  }

  late DataAccessNewPassport dataAccessNewPassport;
  var box = Hive.box("online");

  Future getNewPassport(
      {required String passportResetToken,
      required String textNewPassport,
      required BuildContext context,
      required String phoneNumber}) async {
    try {
      String data = await NetworkChangePassword.newPassport(
          resToken: passportResetToken, passport: textNewPassport);
      ModelAccessNewPassport modelAccessNewPassport =
          ModelAccessNewPassport.fromJson(jsonDecode(data));
      dataAccessNewPassport = modelAccessNewPassport.data;
      box.delete("token");
      box.put("token", dataAccessNewPassport.accessToken);
      box.delete("phoneNumber");
      box.put("phoneNumber", phoneNumber);
      AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,
              animType: AnimType.bottomSlide,
              title: "BMBA",
              desc: "passwordChange".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
              dismissOnTouchOutside: false,
              btnCancelOnPress: () {
                box.delete("langLock");
                box.put("langLock", "1");
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MainPages(homeIdMainpage: "0"),
                    ),
                    (route) => false);
              },
              btnCancelColor: MyColors.appColorBlue1(),
              btnCancelText: "OK")
          .show();
    } catch (e) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,
              animType: AnimType.bottomSlide,
              title: "BMBA",
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
