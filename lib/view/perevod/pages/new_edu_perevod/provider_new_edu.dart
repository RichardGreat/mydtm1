import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mydtm/data/perevod/internet/new_edu/m1_test_region.dart';
import 'package:mydtm/data/perevod/internet/new_edu/m2_test_edu_type.dart';
import 'package:mydtm/data/perevod/model/new_edu/m1_test_region.dart';
import 'package:mydtm/data/perevod/model/new_edu/m2_emode_new_perevod.dart';

class ProviderNewEduPerevod extends ChangeNotifier {
  String testRegion = "";
  String eduType = "";
  String eduLang = "";
  String eduName = "";
  String dirName = "";
  String langName = "";

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

  Future closeWindowPerevod() async {
    textEditNewEduSearch.clear();
  }

  String testRegionNames = "";
  String testRegionId = "";

  Future setTestRegionNewEdu(
      {required String regionId, required String regionName}) async {
    testRegionId = regionId;
    testRegionNames = regionName;
  }

/// Test edu type

  bool boolEduTypeNewPerevod = false;
  NetworkEduTypeNewPerevod networkEduTypeNewPerevod = NetworkEduTypeNewPerevod();
  late ModelEmodeNewPerevod modelEmodeNewPerevod;
  List<DataMassageNewPerevod> listEduTypeNewPerevod = [];

  Future getEduTypeNewPerevod()async{
    try{
      boolEduTypeNewPerevod = false;
      String data = await networkEduTypeNewPerevod.getEduTypeNewPerevod();
      modelEmodeNewPerevod = ModelEmodeNewPerevod.fromJson(jsonDecode(data));
      listEduTypeNewPerevod = modelEmodeNewPerevod.masseage;
      boolEduTypeNewPerevod = true;
      notifyListeners();
    }catch(e){}
  }

  String eduTypeNames = "";
  String eduTypeIds = "";
  Future setEfuNewPerevod({required  String eduTypeName, required String eduTypeId} )async{
    eduTypeNames = eduTypeName;
    eduTypeIds = eduTypeId;
    notifyListeners();
  }


}
