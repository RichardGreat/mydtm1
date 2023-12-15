// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_imie.dart';
import 'package:mydtm/data/internet_connections/m6_profile/network_set_imie.dart';
import 'package:mydtm/data/internet_connections/person_info/passport_info/set_passport_again.dart';
import 'package:mydtm/data/model_parse/m6_model/get_imie_info.dart';
import 'package:mydtm/data/model_parse/person_info/passport_info/model_passport_again.dart';
import 'package:mydtm/data/model_parse/person_info/passport_info/model_set_passport.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';


class ProviderPersonInfo extends ChangeNotifier {
  final formKey123 = GlobalKey<FormState>();
  TextEditingController txtJShShIRController = TextEditingController();
  TextEditingController txtPsSerController = TextEditingController();
  TextEditingController txtPsNumController = TextEditingController();
  bool boolNetworkGetData = false;

  /// ONLINE
  late ModelGetImieInfo modelGetImieInfo;
  late DataGetImieInfo dataGetImieInfo;
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

  bool boolCheckImieHas = false;

  Future getPersonInformation(
      {required BuildContext context, required Function function}) async {
    NetworkGetIMie networkGetIMie = NetworkGetIMie();
    try {
      boolNetworkGetData = true;

      // if (box.get("boxAllPersonInfo").toString().length > 200) {
      //   modelGetImieInfo = ModelGetImieInfo.fromJson(
      //       jsonDecode(box.get("boxAllPersonInfo").toString()));
      // } else {
        String dataInfo = await networkGetIMie.getIMieInformation();
        box.delete("boxAllPersonInfo");
        box.put("boxAllPersonInfo", dataInfo);
        modelGetImieInfo = ModelGetImieInfo.fromJson(jsonDecode(dataInfo));

      // }

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
      box.delete("psser");
      box.delete("personImage");
      box.delete("fio");
      box.put("fio", "$lname $fname $mname");
      box.put("imie", imie);
      box.put("psnum", psnum);
      box.put("psnum", psser);
      box.put("personImage", image);

      boolNetworkGetData = false;
      notifyListeners();
    } catch (e) {
      boolCheckImieHas = true;
      boolNetworkGetData = false;
      notifyListeners();
    }
  }

  NetworkSetImie networkSetImie = NetworkSetImie();
  var box = Hive.box("online");

  Future setPersonInfoServer({required BuildContext context}) async {
    Map<String, String> myMapsImie = {
      "imie": txtJShShIRController.text.trim(),
      "ps_ser": txtPsSerController.text.trim(),
      "ps_num": txtPsNumController.text.trim(),
      "nation": "1",
    };

    boolNetworkGetData = true;
    notifyListeners();
    String imieInfo =
        await networkSetImie.setImie(data: jsonEncode(myMapsImie));
    boolNetworkGetData = false;
    notifyListeners();
    try {
      ModelGetImieInfo modelGetPersonInfo =
          ModelGetImieInfo.fromJson(jsonDecode(imieInfo));
      dataGetImieInfo = modelGetPersonInfo.data;
      psser = modelGetPersonInfo.data.psser;
      psnum = modelGetPersonInfo.data.psnum.toString();
      imie = modelGetPersonInfo.data.imie.toString();
      lname = modelGetPersonInfo.data.lname;
      fname = modelGetPersonInfo.data.fname;
      mname = modelGetPersonInfo.data.mname;
      bdate = modelGetPersonInfo.data.bdate.toString();
      sex = modelGetPersonInfo.data.sex.toString();
      nationId = modelGetPersonInfo.data.nationId.toString();
      image = modelGetPersonInfo.data.image;

      box.delete("imie");
      box.delete("psnum");
      box.delete("psser");
      box.delete("personImage");
      box.delete("fio");
      box.put("fio", "$lname $fname $mname");
      box.put("imie", imie);
      box.put("psnum", psnum);
      box.put("psser", psser);
      box.put("personImage", image);
      boolCheckImieHas = false;
      boolNetworkGetData = false;
      notifyListeners();
    } catch (e) {
      try {
        ModelRegistration2 modelRegistration2 =
            ModelRegistration2.fromJson(jsonDecode(imieInfo));
        MyWidgets.awesomeDialogError(
            context: context, valueText: modelRegistration2.errors);
      } catch (e) {throw Exception(e.toString());}
    }
  }

  NetworkSetPassportAgain networkSetPassportAgain = NetworkSetPassportAgain();

  Future setPersonAgain(
      {required BuildContext context,
      required String psSer,
      required String psNum,
      required Function function1}) async {
    try {
      String data = await networkSetPassportAgain.setPassportInfo(
          passSer: psSer, passNum: psNum);
      PassportAgainStatus passportAgainStatus =
          PassportAgainStatus.fromJson(jsonDecode(data));
      if (passportAgainStatus.data.status.toString() == "1") {
        getPersonInformation(context: context, function: function1);

        AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                animType: AnimType.bottomSlide,
                title: "BBA",
                desc: "saved".tr(),
                titleTextStyle: TextStyle(
                    color: MyColors.appColorBlue1(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                descTextStyle: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.bold),
                btnCancelOnPress: () {
                  Navigator.of(context).pop();
                  // pushNewScreen(context, screen: AddressInfo(funcState: funcState), withNavBar: false);
                },
                btnCancelText: "continue".tr())
            .show();
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future getWindow({required BuildContext context}) async {
    Navigator.of(context).pop();
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                AddressInfo(funcState: functionBosh, addressWindowId: "2"),
            ));
  }

  String nationIds = "", nationNames = "";

  Future setNation(
      {required String nationId, required String nationName}) async {
    nationIds = nationId;
    nationNames = nationName;
    boolNationChoose(boolNation: true);
    notifyListeners();
  }

  /// for Button color
  bool myBoolWidget = false;
  bool boolJShShIR = false;
  bool boolPsSer = false;
  bool boolPsNum = false;
  bool boolChooseNation = false;

  Future boolShShIR({required bool boolShiR}) async {
    boolJShShIR = boolShiR;
  }

  Future boolPsSera({required bool boolSer}) async {
    boolPsSer = boolSer;
  }

  Future boolPsNumber({required bool boolNum}) async {
    boolPsNum = boolNum;
  }

  Future boolNationChoose({required bool boolNation}) async {
    boolChooseNation = boolNation;
  }

  Future functionBosh() async {}
}
