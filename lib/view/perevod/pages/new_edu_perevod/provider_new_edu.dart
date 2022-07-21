import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/perevod/internet/new_edu/m1_test_region.dart';
import 'package:mydtm/data/perevod/internet/new_edu/m2_test_edu_type.dart';
import 'package:mydtm/data/perevod/internet/new_edu/m3_edu_langs.dart';
import 'package:mydtm/data/perevod/internet/new_edu/m4_edu.dart';
import 'package:mydtm/data/perevod/internet/new_edu/m5_dir.dart';
import 'package:mydtm/data/perevod/internet/uzb_edu_perevod.dart';
import 'package:mydtm/data/perevod/model/new_edu/m1_test_region.dart';
import 'package:mydtm/data/perevod/model/new_edu/m2_emode_new_perevod.dart';
import 'package:mydtm/data/perevod/model/new_edu/m3_edu_lang_new_perevod.dart';
import 'package:mydtm/data/perevod/model/new_edu/m4_edu_new_perevod.dart';
import 'dart:developer';

import 'package:mydtm/data/perevod/model/new_edu/m5_dir_new_perevod.dart';

class ProviderNewEduPerevod extends ChangeNotifier {

  String testRegionNames = "";
  String testRegionId = "";
  String eduTypeNames = "";
  String eduTypeIds = "";
  String langIds = "";
  String langNames = "";
  String dirNames = "";
  String dirIds = "";

  bool boolTestRegion = false;
  List<DataTestRegion> listTestRegion = [];
  List<DataTestRegion> listTestRegionTemp = [];
  NetworkTestRegionPerevod networkTestRegionPerevod =
      NetworkTestRegionPerevod();
  TextEditingController textEditNewEduSearch = TextEditingController();

  /// Test region

  Future testRegionUser({required BuildContext context}) async {
    try {
      boolTestRegion = false;
      String data = await networkTestRegionPerevod.getTestRegion();
      ModelTestRegionPerevod modelTestRegionPerevod =
          ModelTestRegionPerevod.fromJson(jsonDecode(data));
      listTestRegion = modelTestRegionPerevod.testRegion;
      listTestRegionTemp.clear();
      listTestRegionTemp.addAll(listTestRegion);
      boolTestRegion = true;
      notifyListeners();
    } catch (e) {}
  }

  Future searchTestRegion({required String val}) async {
    listTestRegionTemp.clear();
    for (var value in listTestRegion) {
      if (value.name.trim().toLowerCase().contains(val.trim().toLowerCase())) {
        listTestRegionTemp.add(value);
      }
    }
    notifyListeners();
  }

  Future closeWindowPerevod({required BuildContext context}) async {
    textEditNewEduSearch.clear();
    Navigator.of(context).pop();
  }



  Future setTestRegionNewEdu(
      {required String regionId, required String regionName}) async {
    testRegionId = regionId;
    testRegionNames = regionName;
  }

  /// Test edu type

  bool boolEduTypeNewPerevod = false;
  NetworkEduTypeNewPerevod networkEduTypeNewPerevod =
      NetworkEduTypeNewPerevod();
  late ModelEmodeNewPerevod modelEmodeNewPerevod;
  List<DataMassageNewPerevod> listEduTypeNewPerevod = [];

  Future getEduTypeNewPerevod() async {
    try {
      boolEduTypeNewPerevod = false;
      String data = await networkEduTypeNewPerevod.getEduTypeNewPerevod();
      modelEmodeNewPerevod = ModelEmodeNewPerevod.fromJson(jsonDecode(data));
      listEduTypeNewPerevod = modelEmodeNewPerevod.masseage;
      boolEduTypeNewPerevod = true;
      notifyListeners();
    } catch (e) {}
  }



  Future setEfuNewPerevod(
      {required String eduTypeName, required String eduTypeId}) async {
    eduTypeNames = eduTypeName;
    eduTypeIds = eduTypeId;
    notifyListeners();
  }

  /// Test edu lang
  bool boolEduLang = false;
  NetworkEduLangNewPerevod networkEduLangNewPerevod =
      NetworkEduLangNewPerevod();
  late ModelEduLangNewPerevod modelEduLangNewPerevod;
  List<DataLangNewPerevod> listDataLang = [];
  TextEditingController textEduLang = TextEditingController();

  Future getEduLangPerevod() async {
    try {
      boolEduLang = false;
      String data =
          await networkEduLangNewPerevod.getEduLang(emodeId: eduTypeIds);
      modelEduLangNewPerevod =
          ModelEduLangNewPerevod.fromJson(jsonDecode(data));
      listDataLang = modelEduLangNewPerevod.lang;
      boolEduLang = true;
      notifyListeners();
    } catch (e) {}
  }



  Future setLangEdu({required String langId, required String langName}) async {
    langIds = langId;
    langNames = langName;
  }

  /// Test Edu

  bool boolEdu = false;
  NetworkEduNewPerevod networkEduNewPerevod = NetworkEduNewPerevod();
  late ModelEduNewPerevod modelEduNewPerevod;
  List<Education> listEdu = [];
  List<Education> listEduTemp = [];
  TextEditingController textEditEdu = TextEditingController();

  Future getEdu() async {
    try {
      boolEdu = false;
      String data = await networkEduNewPerevod.getEdu(
          emodeId: eduTypeIds, langId: langIds);
      modelEduNewPerevod = ModelEduNewPerevod.fromJson(jsonDecode(data));
      listEdu = modelEduNewPerevod.education;
      listEduTemp.clear();
      listEduTemp.addAll(listEdu);
      boolEdu = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future searchEdu({required String val}) async {
    listEduTemp.clear();
    for (var value in listEdu) {
      if (value.name
          .trim()
          .toLowerCase()
          .contains(val.toString().trim().toLowerCase())) {
        listEduTemp.add(value);
      }
    }
    notifyListeners();
  }

  Future closeWindowEdu({required BuildContext context}) async {
    textEditEdu.clear();
    Navigator.of(context).pop();
  }

  String eduNames = "";
  String eduIds = "";

  Future setEduNewPerevod(
      {required String eduName, required String eduId}) async {
    eduNames = eduName;
    eduIds = eduId;
    notifyListeners();
  }

  /// Dir
  bool boolDir = false;
  NetworkDirNewPerevod networkDirNewPerevod = NetworkDirNewPerevod();
  late ModelDirNewPerevod modelDirNewPerevod;
  List<DataMvdirNewPerevod> listMvDir = [];
  List<DataMvdirNewPerevod> listMvDirTemp = [];
  TextEditingController textEditMvDir = TextEditingController();

  Future getDir() async {
    try {
      boolDir = false;
      String data = await networkDirNewPerevod.getDir(
          emodeId: eduTypeIds, langId: langIds, eduId: eduIds);
      modelDirNewPerevod = ModelDirNewPerevod.fromJson(jsonDecode(data));
      listMvDir = modelDirNewPerevod.mvdir;
      listMvDirTemp.clear();
      listMvDirTemp.addAll(listMvDir);
      boolDir = true;
      notifyListeners();
    } catch (e) {}
  }

  Future searchDir({required String value}) async {
    listMvDirTemp.clear();
    for (var val in listMvDir) {
      if (val.name
          .toString()
          .trim()
          .toLowerCase()
          .contains(value.trim().toLowerCase())) {
        listMvDirTemp.add(val);
      }
    }
    notifyListeners();
  }

  Future closeWindowDir({required BuildContext context}) async {
    textEditMvDir.clear();
    Navigator.of(context).pop();
  }


  Future setDir({required String dirName, required   String dirId})async{
    dirNames = dirName;
    dirIds = dirId;
    notifyListeners();
  }
}
