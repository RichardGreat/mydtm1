import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mydtm/data/perevod/internet/countrys.dart';
import 'package:mydtm/data/perevod/internet/edu_type.dart';
import 'package:mydtm/data/perevod/internet/uzb_edu_perevod.dart';
import 'package:mydtm/data/perevod/model/country_model.dart';
import 'package:mydtm/data/perevod/model/edu.dart';
import 'package:mydtm/data/perevod/model/edu_type.dart';

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
  Future getEduLang()async{
    try{
      boolEduLang = false;


    }catch(e){}
  }
  /// UZB edu
  NetworkEduPerevod networkEduPerevod = NetworkEduPerevod();
  late ModelGetEduPerevod modelGetEduPerevod;
  List<DataGetEduPerevod> listDataGetPerevod = [];
  List<DataGetEduPerevod> listDataGetPerevodTemp = [];
  bool boolEdu = false;


  Future getUzbEdu() async {
    try{
      boolEdu = false;
     String data = await networkEduPerevod.getEdu(emode: setEduTypePerevodId, langId: restRegionNamePerevodId);
     modelGetEduPerevod = ModelGetEduPerevod.fromJson(jsonDecode(data));
     listDataGetPerevod = modelGetEduPerevod.education;
     listDataGetPerevodTemp.clear();
     listDataGetPerevodTemp.addAll(listDataGetPerevod);

     boolEdu = true;
     notifyListeners();

    }catch(e){}

  }
}
