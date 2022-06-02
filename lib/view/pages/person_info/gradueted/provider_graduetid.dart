import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/country.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/g_edu_type.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/get_graduated_all.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/year_graduated.dart';
import 'package:mydtm/data/model_parse/person_info/g_edu_type.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/all_info_graduated.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/g_country.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/graduated_year.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_forgione/state_choose.dart';
import 'package:mydtm/view/pages/person_info/gradueted/model_sheet/graduated_type.dart';
import 'package:mydtm/view/pages/person_info/gradueted/model_sheet/graduated_year.dart';

class ProviderGraduated extends ChangeNotifier {
  final formKeyGraduated = GlobalKey<FormState>();

  bool boolUzbekGraduated = true;
  /// All info graduated
  NetworkGetGraduated networkGetGraduated = NetworkGetGraduated();
  late ModelGraduatedInfo modelGraduatedInfo;
  late DataGraduatedInfo dataGraduatedInfo;
  bool boolAllInfoGraduated = false;

  String gTypeName = "";
  String gTypeId = "";
  String gCountryName = "";
  String gCountryId = "";
  String gProvinceName = "";
  String gProvinceId = "";
  String gDistrictName = "";
  String gDistrictId = "";
  String gName = "";
  String gId = "";
  String gYear = "";
  String gSerNome = "";

  TextEditingController textEditingSerNumber = TextEditingController();



  Future getAllInfoGraduated()async{

    try{
      boolAllInfoGraduated = false;
      String data = await networkGetGraduated.getAllGraduated();
      modelGraduatedInfo = ModelGraduatedInfo.fromJson(jsonDecode(data));
      checkAllInfo(dataGraduatedInfo: modelGraduatedInfo.data);
      // dataGraduatedInfo = modelGraduatedInfo.data;
      boolAllInfoGraduated = true;
      notifyListeners();
    }catch(e){}

  }

  Future checkAllInfo({required DataGraduatedInfo dataGraduatedInfo})async{
    try{
      log(jsonEncode(dataGraduatedInfo));
      if(dataGraduatedInfo.countryId == 860&& dataGraduatedInfo.eduTypeId != 4){
        boolUzbekGraduated = true;
        gTypeName = dataGraduatedInfo.eduName.toString();
        gTypeId = dataGraduatedInfo.eduTypeId.toString();
        gCountryName = dataGraduatedInfo.countryName;
        gCountryId = dataGraduatedInfo.countryId.toString();
        gProvinceName = dataGraduatedInfo.regionName;
        gProvinceId = dataGraduatedInfo.regionId.toString();
        gDistrictName = dataGraduatedInfo.districtName;
        gDistrictId = dataGraduatedInfo.districtId.toString();
        gName = dataGraduatedInfo.gName;
        gId = dataGraduatedInfo.eduTypeId.toString();
        gYear = dataGraduatedInfo.graduatedYear.toString();
        textEditingSerNumber.text = dataGraduatedInfo.docSerNum;
        notifyListeners();
      } else if(dataGraduatedInfo.countryId == 860 && dataGraduatedInfo.eduTypeId == 4){
        boolUzbekGraduated = true;
        gTypeName = dataGraduatedInfo.eduName.toString();
        gTypeId = dataGraduatedInfo.eduTypeId.toString();
        gCountryName = dataGraduatedInfo.countryName;
        gCountryId = dataGraduatedInfo.countryId.toString();
        gProvinceName = dataGraduatedInfo.regionName;
        gProvinceId = dataGraduatedInfo.regionId.toString();
        gDistrictName = dataGraduatedInfo.districtName;
        gDistrictId = dataGraduatedInfo.districtId.toString();
        gName = dataGraduatedInfo.gName;
        gId = dataGraduatedInfo.eduTypeId.toString();
        gYear = dataGraduatedInfo.graduatedYear.toString();
        textEditingSerNumber.text = dataGraduatedInfo.docSerNum;

        notifyListeners();
      }

      else{
        boolUzbekGraduated = false;
        gTypeName = dataGraduatedInfo.eduName.toString();
        gTypeId = dataGraduatedInfo.eduTypeId.toString();
        gCountryName = dataGraduatedInfo.countryName;
        gCountryId = dataGraduatedInfo.countryId.toString();
        gProvinceName = dataGraduatedInfo.regionName;
        gProvinceId = dataGraduatedInfo.regionId.toString();
        gDistrictName = dataGraduatedInfo.districtName;
        gDistrictId = dataGraduatedInfo.districtId.toString();
        gName = dataGraduatedInfo.gName;
        gId = dataGraduatedInfo.eduTypeId.toString();
        gYear = dataGraduatedInfo.graduatedYear.toString();
        textEditingSerNumber.text = dataGraduatedInfo.docSerNum;
        notifyListeners();
      }


    }catch(e){
      log(e.toString());
    }


  }


  /// graduated type
  String graduatedName = "", graduatedId = "";
  bool boolGraduatedType = true;
  NetworkGeneralEduType networkGeneralEduType = NetworkGeneralEduType();
  List<DataGeneralEduType> listGeneralEduType = [];
  bool boolGEduType = false;

  Future getGraduatedType(
      {required BuildContext context,
      required ProviderGraduated providerGraduated}) async {
    try {
      String dataGEduType = await networkGeneralEduType.getGeneralEduType();
      boolGEduType = false;
      ModelGeneralEduType modelGeneralEduType =
          ModelGeneralEduType.fromJson(jsonDecode(dataGEduType));
      listGeneralEduType = modelGeneralEduType.data;
      modelSheetGraduatedType(
          contexts: context, providerGraduated: providerGraduated);
      boolGEduType = true;
      notifyListeners();
    } catch (e) {}

    notifyListeners();
  }

  /// State foreign

  NetworkGraduatedCountry networkGraduatedCountry = NetworkGraduatedCountry();
  List<DataGraduatedCountry> listGraduatedCountry = [];
  List<DataGraduatedCountry> listGraduatedCountryTemp = [];
  bool boolGraduatedCountry = false;

  TextEditingController txtControllerGraduatedCountry = TextEditingController();
  TextEditingController txtControllerGraduatedName = TextEditingController();


  String foreignCountryName = "";
  String foreignCountryId = "";
  Future getCountry(
      {required BuildContext context,
      required ProviderGraduated providerGraduated}) async {
    try {
      boolGraduatedCountry = false;
      String dataGraduated = await networkGraduatedCountry.getCountry();
      ModelGraduatedCountry modelGraduatedCountry =
          ModelGraduatedCountry.fromJson(jsonDecode(dataGraduated));
      listGraduatedCountry = modelGraduatedCountry.data;
      listGraduatedCountryTemp = listGraduatedCountry;
      modelSheetStateChoose(
          context: context, providerGraduated: providerGraduated);
      boolGraduatedCountry = true;

      notifyListeners();
    } catch (e) {}
  }

  Future searchCountry({required String value}) async {
    listGraduatedCountryTemp.clear();

    for (var values in listGraduatedCountry) {
      if (values.name
          .toLowerCase()
          .contains(value.toLowerCase())) {
        log(jsonEncode(values));
        listGraduatedCountryTemp.add(values);
      } else {
        log(jsonEncode(values));
      }
    }
    notifyListeners();
  }

  Future setForeign({required String name, required String id})async{
    gCountryName  = name;
    gCountryId  = id;
    notifyListeners();
  }


  ///

  /// Graduated year

  NetworkGraduatedYear networkGraduatedYear = NetworkGraduatedYear();
  late DataGraduatedYear dataGraduatedYear;
  List<String> listGraduatedYear = [];
  List<String> listGraduatedYearTemp = [];
  bool boolGraduatedYear = false;
  String setGraduatedYear = "";
  TextEditingController textEditYearSearch = TextEditingController();

  Future getYear(
      {required BuildContext contexts,
      required ProviderGraduated providerGraduated}) async {
    try {
      print("dataGraduated");
      boolGraduatedYear = false;
      String dataGraduated = await networkGraduatedYear.getYear();
      print(dataGraduated);
      ModelGraduatedYear modelGraduatedYear =
          ModelGraduatedYear.fromJson(jsonDecode(dataGraduated));
      for (int i = int.parse(modelGraduatedYear.data.beginYear);
          i <= int.parse(modelGraduatedYear.data.endYear);
          i++) {
        listGraduatedYear.add("$i-${"year".tr()}");
      }
      // listGraduatedYearTemp.clear();
      listGraduatedYearTemp =  listGraduatedYear;
      modelSheetGraduatedYear(
          contexts: contexts, providerGraduated: providerGraduated);

      boolGraduatedYear = true;

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future searchYear({required String value}) async {
    listGraduatedYearTemp.clear();

    for (var values in listGraduatedYear) {
      if (values.toString().contains(value.toString())) {
       print(values);
        listGraduatedYearTemp.add(values);
      }
    }
    notifyListeners();
  }
  Future closeGraduatedSheet({required BuildContext context}) async {
    listGraduatedCountryTemp.clear();
    listGraduatedCountryTemp = listGraduatedCountry;
    txtControllerGraduatedCountry.clear();
    Navigator.of(context).pop();
  }


  Future setMethodGraduatedYear({required String id}) async {
    setGraduatedYear = id;
    notifyListeners();
  }

  Future setGraduatedType({required String name, required String id}) async {
    gTypeName  = name;
    gTypeId  = id;

    if (gTypeId == "4") {
      boolGraduatedType = false;
    } else {
      boolGraduatedType = true;
    }
    notifyListeners();
  }

  ///


}
