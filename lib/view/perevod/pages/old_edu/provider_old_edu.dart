import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mydtm/data/perevod/internet/countrys.dart';
import 'package:mydtm/data/perevod/internet/edu_lang_perevod.dart';
import 'package:mydtm/data/perevod/internet/edu_type.dart';
import 'package:mydtm/data/perevod/internet/get_edu_direct.dart';
import 'package:mydtm/data/perevod/internet/uzb_edu_perevod.dart';
import 'package:mydtm/data/perevod/model/country_model.dart';
import 'package:mydtm/data/perevod/model/edu.dart';
import 'package:mydtm/data/perevod/model/edu_lang_old.dart';
import 'package:mydtm/data/perevod/model/edu_type.dart';
import 'package:mydtm/data/perevod/model/model_mvdir.dart';

class ProviderOldEdu extends ChangeNotifier {
  late String restRegionNamePerevod = "";
  late String eduTypeName = "";

  late String langName = "";
  late String langId = "";
  late String langGraphicName = "";

  Future getAllDataEdit() async {}

  /// Get Country

  bool boolForeignCountry = false;
  NetworkCountryPerevod networkCountryPerevod = NetworkCountryPerevod();
  List<DataGetCountryPerevod> listDataCountryPerevod = [];
  List<DataGetCountryPerevod> listDataCountryPerevodTemp = [];
  TextEditingController textControllerCountryPerevod = TextEditingController();

  Future getForeignCountry() async {
    try {
      boolForeignCountry = false;
      String dataNet = await networkCountryPerevod.getCountries();
      ModelGetCountryPerevod modelGetCountryPerevod =
          ModelGetCountryPerevod.fromJson(jsonDecode(dataNet));
      listDataCountryPerevod = modelGetCountryPerevod.masseage;
      listDataCountryPerevodTemp.clear();
      listDataCountryPerevodTemp.addAll(listDataCountryPerevod);
      boolForeignCountry = true;
      notifyListeners();
    } catch (e) {
      boolForeignCountry = true;
    }
  }

  Future searchCountryPerevod({required String values}) async {
    listDataCountryPerevodTemp.clear();

    notifyListeners();
    for (var val in listDataCountryPerevod) {
      if (val.name.toLowerCase().contains(values.trim().toLowerCase())) {
        listDataCountryPerevodTemp.add(val);
        notifyListeners();
      }
    }

    notifyListeners();
  }

  String restRegionNamePerevodId = "";

  Future setCountryVal({required String name, required String id}) async {
    restRegionNamePerevod = name;
    restRegionNamePerevodId = id;
    notifyListeners();
  }

  Future closeWindowPerevod({required BuildContext context}) async {
    textControllerCountryPerevod.clear();
    Navigator.of(context).pop();
  }

  /// Edu tpye

  List<DataGetEduTypeMasseage> listDataEduType = [];
  List<DataGetEduTypeMasseage> listDataEduTypeTemp = [];
  bool boolEduType = false;
  NetworkEduTypePerevod networkEduTypePerevod = NetworkEduTypePerevod();

  Future getEduTypePerevod() async {
    try {
      boolEduType = false;
      String dataNet = await networkEduTypePerevod.getEduType();
      ModelGetEduTypePerevod modelGetEduTypePerevod =
          ModelGetEduTypePerevod.fromJson(jsonDecode(dataNet));
      listDataEduType = modelGetEduTypePerevod.masseage;
      listDataEduTypeTemp.clear();
      listDataEduTypeTemp.addAll(listDataEduType);
      boolEduType = true;
      notifyListeners();
    } catch (e) {
      boolEduType = true;
    }
  }

  String setEduTypePerevodId = "";

  Future setEduTypeVal({required String name, required String id}) async {
    eduTypeName = name;
    setEduTypePerevodId = id;
    notifyListeners();
  }

  /// Edu lang
  bool boolEduLang = false;
  NetworkEduLangPerevod networkEduLangPerevod = NetworkEduLangPerevod();
  List<DataLangOldPerevod> listDataLangOld = [];

  Future getEduLang() async {
    try {
      boolEduLang = false;
      String dataEduLang = await networkEduLangPerevod.getEduLangType(
          emodeID: setEduTypePerevodId);
      ModelEduLangPerevod modelEduLangPerevod =
          ModelEduLangPerevod.fromJson(jsonDecode(dataEduLang));
      listDataLangOld = modelEduLangPerevod.lang;
      boolEduLang = true;
      notifyListeners();
    } catch (e) {}
  }

  /// Edu lang

  String eduLangName = "";
  String eduLangId = "";

  Future setEduLangOld({required String name, required String id}) async {
    eduLangName = name;
    eduLangId = id;
    notifyListeners();
  }

  /// Edu name uzb
  NetworkEduPerevod networkEduPerevod = NetworkEduPerevod();
  late ModelGetEduPerevod modelGetEduPerevod;
  List<DataGetEduPerevod> listDataGetPerevod = [];
  List<DataGetEduPerevod> listDataGetPerevodTemp = [];
  bool boolEdu = false;

  Future getUzbEdu() async {
    try {
      boolEdu = false;
      String data = await networkEduPerevod.getEdu(
          emode: setEduTypePerevodId, langId: eduLangId);
      modelGetEduPerevod = ModelGetEduPerevod.fromJson(jsonDecode(data));
      print(data);
      listDataGetPerevod = modelGetEduPerevod.education;
      listDataGetPerevodTemp.clear();
      listDataGetPerevodTemp.addAll(listDataGetPerevod);
      boolEdu = true;
      notifyListeners();
    } catch (e) {}
  }

  Future searchEduName({required String nameEdu}) async {
    try {
      boolEdu = false;
      notifyListeners();
      listDataGetPerevodTemp.clear();
      for (var valeus in listDataGetPerevod) {
        if (valeus.name
            .trim()
            .toLowerCase()
            .contains(nameEdu.trim().toLowerCase())) {
          listDataGetPerevodTemp.add(valeus);
        }
      }
      boolEdu = true;
      notifyListeners();
    } catch (e) {}
  }

  String eduUzbName = "";
  String eduUzbId = "";

  Future setEduName({required String name, required String eduId}) async {
    eduUzbName = name;
    eduUzbId = eduId;
    notifyListeners();
  }

  /// Edu Direction

  bool boolEduDirection = false;
  NetworkUzbEduDirPerevod networkUzbEduDirPerevod = NetworkUzbEduDirPerevod();
  List<DataMvdirPerevod> listDataMVDir = [];
  List<DataMvdirPerevod> listDataMVDirTemp = [];

  Future getEduDir() async {
    try {
      boolEduDirection = false;
      String data = await networkUzbEduDirPerevod.getUzbEduDir(
          emod: setEduTypePerevodId, langId: eduLangId, eduId: eduUzbId);
      ModelEduMvDirPerevod modelEduMvDirPerevod =
          ModelEduMvDirPerevod.fromJson(jsonDecode(data));
      listDataMVDir = modelEduMvDirPerevod.mvdir;
      listDataMVDirTemp.clear();
      listDataMVDirTemp.addAll(listDataMVDir);
      boolEduDirection = true;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future searchEduDir({required String dirName}) async {
    try {
      boolEduDirection = false;
      notifyListeners();
      listDataMVDirTemp.clear();
      for (var valeus in listDataMVDir) {
        if (valeus.name
            .trim()
            .toLowerCase()
            .contains(dirName.trim().toLowerCase())) {
          listDataMVDirTemp.add(valeus);
        }
      }
      boolEduDirection = true;
      notifyListeners();
    } catch (e) {}
  }


  String dirNames = "";
  String dirIds = "";
  Future setEduDirection({required String dirName, required String dirId})async{
    try{
      dirNames = dirName;
      dirIds = dirId;
      notifyListeners();
    }catch(e){}
  }

  /// Graduated Year
  String graduatedYear = "";
  String graduatedYearNames = "";
  Future setGraduatedYears({required String year,  required String graduatedYearName})async{
    graduatedYear = year;
    graduatedYearNames = graduatedYearName;
    notifyListeners();
  }



}
