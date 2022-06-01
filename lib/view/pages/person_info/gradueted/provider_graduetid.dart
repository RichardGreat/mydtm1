import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/country.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/g_edu_type.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/year_graduated.dart';
import 'package:mydtm/data/model_parse/person_info/g_edu_type.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/g_country.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/graduated_year.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_forgione/state_choose.dart';
import 'package:mydtm/view/pages/person_info/gradueted/model_sheet/graduated_type.dart';
import 'package:mydtm/view/pages/person_info/gradueted/model_sheet/graduated_year.dart';

class ProviderGraduated extends ChangeNotifier {
  final formKeyGraduated = GlobalKey<FormState>();

  bool boolUzbekGraduated = true;

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

  /// State

  NetworkGraduatedCountry networkGraduatedCountry = NetworkGraduatedCountry();
  List<DataGraduatedCountry> listGraduatedCountry = [];
  List<DataGraduatedCountry> listGraduatedCountryTemp = [];
  bool boolGraduatedCountry = false;
  TextEditingController txtControllerGraduatedCountry = TextEditingController();

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
          .trim()
          .toLowerCase()
          .contains(value.trim().toLowerCase())) {
        log(jsonEncode(values));
        listGraduatedCountryTemp.add(values);
      } else {
        log(jsonEncode(values));
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
        listGraduatedYear.add(i.toString());
      }
      listGraduatedYearTemp.clear();
      listGraduatedYearTemp=[];
      listGraduatedYearTemp.addAll(listGraduatedYear);
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
      if (values.trim().contains(value.trim())) {
        listGraduatedYearTemp.add(values);
      }
    }
    notifyListeners();
  }
  Future closeWindow()async{}

  Future setMethodGraduatedYear({required String id}) async {
    setGraduatedYear = id;
    notifyListeners();
  }

  Future setGraduatedType({required String name, required String id}) async {
    graduatedName = name;
    graduatedId = id;

    if (graduatedId == "4") {
      boolGraduatedType = false;
    } else {
      boolGraduatedType = true;
    }
    notifyListeners();
  }
}
