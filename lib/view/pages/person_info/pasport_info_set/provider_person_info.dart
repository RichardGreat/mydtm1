import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_imie.dart';
import 'package:mydtm/data/model_parse/m6_model/get_imie_info.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';

class ProviderPersonInfo extends ChangeNotifier {
  final formKey123 = GlobalKey<FormState>();
  TextEditingController txtJShShIRController = TextEditingController();
  TextEditingController txtPsSerController = TextEditingController();
  TextEditingController txtPsNumController = TextEditingController();
  bool boolNetworkGetData = false;

  /// ONLINE
  late ModelGetImieInfo modelGetImieInfo;
  late DataGetImieInfo dataGetImieInfo;
  late String
      psser,
      psnum,
      imie,
      lname,
      fname,
      mname,
      bdate,
      sex,
      nationId,
      image;

  Future getPersonInformation({required BuildContext context}) async {
    NetworkGetIMie networkGetIMie = NetworkGetIMie();
    try {
      boolNetworkGetData = true;
      String dataInfo = await networkGetIMie.getIMieInformation();
      log(dataInfo.toString());
      modelGetImieInfo = ModelGetImieInfo.fromJson(jsonDecode(dataInfo));
      dataGetImieInfo = modelGetImieInfo.data;

      psser = dataGetImieInfo.psser;
      psnum = dataGetImieInfo.psnum.toString();
      imie = dataGetImieInfo.imie;
      lname = dataGetImieInfo.lname;
      fname = dataGetImieInfo.fname;
      mname = dataGetImieInfo.mname;
      bdate = dataGetImieInfo.bdate;
      sex = dataGetImieInfo.sex.toString();
      nationId = dataGetImieInfo.nationId.toString();
      image = dataGetImieInfo.image;

      boolNetworkGetData = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future getWindow({required BuildContext context}) async {
    Navigator.of(context).pop();
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const AddressInfo(),
        ));
  }

  ///
  String nationIds ="", nationNames="";

  Future setNation({required String nationId, required String nationName})async{
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

  Future boolShShIR({required bool boolShiR})async{
    boolJShShIR = boolShiR;
}

  Future boolPsSera({required bool boolSer})async{
    boolPsSer = boolSer;
  }

  Future boolPsNumber({required bool boolNum})async{
    boolPsNum = boolNum;
  }

  Future boolNationChoose({required bool boolNation})async{
    boolChooseNation = boolNation;
  }

// Future boolPasswordVisibleMethod() async {
//   boolPasswordVisible = !boolPasswordVisible;
//   notifyListeners();
// }
}