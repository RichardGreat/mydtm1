import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/edu_choose/edu_lang/lang_choose_edu.dart';
import 'package:mydtm/data/internet_connections/edu_choose/emode/emode_choose.dart';
import 'package:mydtm/data/internet_connections/edu_choose/otm/dir1.dart';
import 'package:mydtm/data/internet_connections/edu_choose/otm/otm_1.dart';
import 'package:mydtm/data/internet_connections/edu_choose/region/choose_region.dart';
import 'package:mydtm/data/model_parse/edu_choose/emode/emodes.dart';
import 'package:mydtm/data/model_parse/edu_choose/lang/lang_edu_model.dart';
import 'package:mydtm/data/model_parse/edu_choose/otm/dir.dart';
import 'package:mydtm/data/model_parse/edu_choose/otm/otm.dart';
import 'package:mydtm/data/model_parse/edu_choose/region.dart';
import 'package:mydtm/view/pages/otm/widgets/select_direction/otm/otm.dart';

class ProviderChooseEdu extends ChangeNotifier {
  late String testRegionId;

  /// Choose direction
  //#Bloc1
  // Choose region
  NetworkEduChooseRegion networkChooseEduRegion = NetworkEduChooseRegion();
  late ModelEduChooseRegion modelEduChooseRegion;
  Map<String, String> mapModelEduChoose = {};
  List<ListModelEduChooseRegion> listEduChooseRegion = [];
  List<ListModelEduChooseRegion> listEduChooseRegionTemp = [];
  TextEditingController textSearchRegionEduChoose = TextEditingController();
  bool boolEduChoose = false;

  Future getChooseRegion(
      {required BuildContext context,
      required ProviderChooseEdu providerChooseEdu}) async {
    boolEduChoose = false;
    String data = await networkChooseEduRegion.getChooseEduRegion();
    modelEduChooseRegion = ModelEduChooseRegion.fromJson(jsonDecode(data));
    mapModelEduChoose = modelEduChooseRegion.data;
    listEduChooseRegion.clear();
    listEduChooseRegion = mapModelEduChoose.entries
        .map((entry) => ListModelEduChooseRegion(
              regionId: entry.key.toString(),
              regionName: entry.value,
            ))
        .toList();
    listEduChooseRegionTemp.clear();
    listEduChooseRegionTemp.addAll(listEduChooseRegion);
    boolEduChoose = true;
    notifyListeners();
  }

  Future searchRegionEduChoose({required String value}) async {
    listEduChooseRegionTemp.clear();
    for (var val in listEduChooseRegion) {
      if (val.regionName
          .toString()
          .toLowerCase()
          .contains(value.trim().toLowerCase())) {
        listEduChooseRegionTemp.add(val);
      }
    }
    notifyListeners();
  }

  Future clearTextEduChooseRegion() async {
    boolEduChoose = false;
    notifyListeners();
    listEduChooseRegionTemp.clear();
    textSearchRegionEduChoose.clear();
    listEduChooseRegionTemp.addAll(listEduChooseRegion);
    boolEduChoose = true;
    notifyListeners();
  }

  String testRegionNames = "";

  Future setTestRegion(
      {required String regionId, required String regionName}) async {
    Future.delayed(Duration.zero);
    testRegionId = regionId;
    testRegionNames = regionName;
    notifyListeners();
  }

//#Bloc2
// Choose Language test

  NetworkEduLangEduChoose networkEduLangEduChooseTest =
      NetworkEduLangEduChoose();
  late ModelLangEduChoose modelLangEduChooseTest;
  List<DataLangEduChoose> listLangEduChooseTest = [];
  List<DataLangEduChoose> listLangEduChooseTestTemp = [];
  TextEditingController textLangEduChooseTestController =
      TextEditingController();
  bool boolLangEduTest = false;

  Future getLangEduChooseTest(
      {required BuildContext context,
      required ProviderChooseEdu providerChooseEdu}) async {
    boolLangEduTest = false;
    String dataLangEduTest =
        await networkEduLangEduChooseTest.getLangEduChoose();
    modelLangEduChooseTest =
        ModelLangEduChoose.fromJson(jsonDecode(dataLangEduTest));
    listLangEduChooseTest.clear();
    listLangEduChooseTest.addAll(modelLangEduChooseTest.data);
    listLangEduChooseTestTemp.clear();
    listLangEduChooseTestTemp.addAll(listLangEduChooseTest);
    boolLangEduTest = true;
    notifyListeners();
  }

  Future searchLangEduChooseTest({required String value}) async {
    listLangEduChooseTestTemp.clear();
    for (var val in listLangEduChooseTest) {
      if (val.name
          .toString()
          .toLowerCase()
          .contains(value.trim().toLowerCase())) {
        listLangEduChooseTestTemp.add(val);
      }
    }
    notifyListeners();
  }

  Future clearTextLangEduChoose() async {
    boolLangEduTest = false;
    notifyListeners();
    listLangEduChooseTestTemp.clear();
    textLangEduChooseTestController.clear();
    listLangEduChooseTestTemp.addAll(listLangEduChooseTest);
    boolLangEduTest = true;
    notifyListeners();
  }

  String langId = "";
  String langName = "";

  Future setLanguage({required String name, required String id}) async {
    langName = name;
    langId = id;
    log(langId + langName);
    notifyListeners();
  }

//#Bloc3
// Choose Grant Contract
  List<String> listGrantContract = ["grant".tr(), "contract".tr()];
  String grantContractName = "";
  String grantContractId = "";

  Future setGrantContract({required String id, required String name}) async {
    grantContractId = id;
    grantContractName = name;
    notifyListeners();
  }

// #Bolc4
//  choose emode
  NetworkEmodeChoose networkEmodeChoose = NetworkEmodeChoose();
  late ModelEmodeGet modelEmodeGet;
  Map<String, String> modelMapEmodeGet = {};
  List<DataEmodeChoose> listEmodeChoose = [];
  bool boolGetEmode = false;

  Future getEmode() async {
    try {
      boolGetEmode = false;
      String emodeData = await networkEmodeChoose.getEmodeItem(langId: langId);
      modelEmodeGet = ModelEmodeGet.fromJson(jsonDecode(emodeData));
      listEmodeChoose = modelEmodeGet.data.entries
          .map((entry) => DataEmodeChoose(
                id: entry.key,
                name: entry.value,
              ))
          .toList();
      print(jsonEncode(listEmodeChoose));
      boolGetEmode = true;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  String eModeName = "";
  String eModeId = "";

  Future setEMode({required BuildContext context,required ProviderChooseEdu  providerChooseEdu, required String name, required String id}) async {
    eModeName = name;
    eModeId = id;
    sheetOTMEdu(contexts: context, providerChooseEdu: providerChooseEdu);
    notifyListeners();
  }

  // #Bloc5 OTM 1
  NetworkOtm networkOtm = NetworkOtm();
  late ModelOtm1 modelOtm1;
  List<DataOTM> listDataOtm = [];
  List<DataOTM> listDataOtmTemp = [];
  TextEditingController textOTMChoose = TextEditingController();

  bool boolOtmData = false;

  Future getOtm1() async {
    try {
      boolOtmData = false;
      String dataOtm =
          await networkOtm.getOtm1(eModeId: eModeId, langId: langId);
      modelOtm1 = ModelOtm1.fromJson(jsonDecode(dataOtm));
      listDataOtm = modelOtm1.data.entries
          .map((e) => DataOTM(id: e.key, name: e.value))
          .toList();
      listDataOtmTemp.clear();
      listDataOtmTemp.addAll(listDataOtm);
      print(jsonEncode(listDataOtmTemp));
      boolOtmData = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future searchOtm({required String val})async{

    listDataOtmTemp.clear();
    for(var l in listDataOtm){
      if(l.name.toLowerCase().contains(val.trim().toLowerCase())){
        listDataOtmTemp.add(l);
      }
    }
    notifyListeners();

  }
  Future clearTextOtm1()async{
    boolOtmData = false;
    notifyListeners();
    textOTMChoose.clear();
    listDataOtmTemp.clear();
    listDataOtmTemp.addAll(listDataOtm);
    boolOtmData = true;
    notifyListeners();
  }
  List<DataOTM>listOtmNameId = [
    DataOTM(id: "", name: ""),
    DataOTM(id: "", name: ""),
    DataOTM(id: "", name: ""),
    DataOTM(id: "", name: ""),
    DataOTM(id: "", name: "")

  ];
  Future setOtm1({required String name,required String id})async{
    listOtmNameId[0] =  DataOTM(id: id, name: name);
    notifyListeners();
  }


  // #Bloc6 1
  NetworkDir1  networkDir1 = NetworkDir1();
  late ModelDir1 modelDir1;
  Future getDir1()async{
    try{
      String dataDir = await networkDir1.getDir1(
          otmId: listOtmNameId[0].id, isMaqsadId: "  ", langId: langId, emode: eModeId);
    }catch(e){}
  }
}
