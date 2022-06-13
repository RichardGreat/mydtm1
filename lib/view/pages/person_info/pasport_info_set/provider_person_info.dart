import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_imie.dart';
import 'package:mydtm/data/internet_connections/m6_profile/network_set_imie.dart';
import 'package:mydtm/data/model_parse/m6_model/get_imie_info.dart';
import 'package:mydtm/data/model_parse/person_info/passport_info/model_set_passport.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

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

  Future getPersonInformation({required BuildContext context}) async {
    NetworkGetIMie networkGetIMie = NetworkGetIMie();
    try {
      boolNetworkGetData = true;
      String dataInfo = await networkGetIMie.getIMieInformation();
      log(dataInfo);
      modelGetImieInfo = ModelGetImieInfo.fromJson(jsonDecode(dataInfo));
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
      box.put("personImage", image);
      boolNetworkGetData = false;
      notifyListeners();
    } catch (e) {
      boolCheckImieHas = true;
      boolNetworkGetData = false;
      notifyListeners();
      log(e.toString());
    }
  }

  NetworkSetImie networkSetImie = NetworkSetImie();
  var box = Hive.box("online");

  Future setPersonInfoServer({required BuildContext context}) async {
    Map<String, String> myMapsImie = {
      "imie": txtJShShIRController.text,
      "ps_ser": txtPsSerController.text,
      "ps_num": txtPsNumController.text,
      "nation": nationIds,
    };
    log(jsonEncode(myMapsImie));
    boolNetworkGetData = true;
    notifyListeners();
    String imieInfo =
    await networkSetImie.setImie(data: jsonEncode(myMapsImie));
    boolNetworkGetData = false;
    notifyListeners();
    try {
      ModelGetImieInfo modelGetPersonInfo = ModelGetImieInfo.fromJson(
          jsonDecode(imieInfo));
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
      box.put("imie", imie);
      box.put("psnum", psnum);
      boolCheckImieHas = false;
      boolNetworkGetData = false;
      notifyListeners();
    } catch (e) {
      try {
        ModelRegistration2 modelRegistration2 = ModelRegistration2.fromJson(
            jsonDecode(imieInfo));
        MyWidgets.awesomeDialogError(
            context: context, valueText: modelRegistration2.errors);
      } catch (e) {

      }
    }
    log(imieInfo);
  }

  Future getWindow({required BuildContext context}) async {
    Navigator.of(context).pop();
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const AddressInfo(),
        ));
  }

  String nationIds = "",
      nationNames = "";

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

// Future boolPasswordVisibleMethod() async {
//   boolPasswordVisible = !boolPasswordVisible;
//   notifyListeners();
// }
}
