import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_district.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_region.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/country.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/g_edu_type.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/g_graduated_names.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/get_graduated_all.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/set_server.dart';
import 'package:mydtm/data/internet_connections/person_info/graduated/year_graduated.dart';
import 'package:mydtm/data/model_parse/m6_model/district.dart';
import 'package:mydtm/data/model_parse/m6_model/get_country.dart';
import 'package:mydtm/data/model_parse/person_info/g_edu_type.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/all_info_graduated.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/g_country.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/graduated_name.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/graduated_year.dart';
import 'package:mydtm/data/model_parse/person_info/graduated/model_get_graduated.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_forgione/state_choose.dart';
import 'package:mydtm/view/pages/person_info/gradueted/model_sheet/graduated_type.dart';
import 'package:mydtm/view/pages/person_info/gradueted/model_sheet/graduated_year.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';


class ProviderGraduated extends ChangeNotifier {
  final formKeyGraduated = GlobalKey<FormState>();

  bool boolUzbekGraduated = true;

  /// All info graduated
  NetworkGetGraduated networkGetGraduated = NetworkGetGraduated();
  late ModelGraduatedInfo modelGraduatedInfo;
  late DataGraduatedInfo dataGraduatedInfo;
  bool boolAllInfoGraduated = false;



  TextEditingController textEditingSerNumber = TextEditingController();

  bool boolAllInfoGraduatedNot = false;

  Future getAllInfoGraduated() async {

    try {
      boolAllInfoGraduated = false;
      String data = await networkGetGraduated.getAllGraduated();
     log(data);
      modelGraduatedInfo = ModelGraduatedInfo.fromJson(jsonDecode(data));
      // if(modelGraduatedInfo.data.countryId != "860"){
      //   boolGraduatedType = false;
      //   notifyListeners();
      // }
      checkAllInfo(dataGraduatedInfo: modelGraduatedInfo.data);
      boolAllInfoGraduated = true;
      notifyListeners();
    } catch (e) {
      boolAllInfoGraduatedNot = true;
      boolAllInfoGraduated = true;
      notifyListeners();
      log("123");
      log(e.toString());
    }
  }
  List<DataGeneralEduType> listForGet = [
    DataGeneralEduType(name: "O'rta maktab" , id:1 ),
    DataGeneralEduType(name: "Akademik litsey" , id:2 ),
    DataGeneralEduType(name: "Kasb-hunar kolleji", id:3 ),
    DataGeneralEduType(name: "Boshqa o'quv yurti" , id:4 )
  ];

  Future checkAllInfo({required DataGraduatedInfo dataGraduatedInfo}) async {
    try {
      log(jsonEncode(dataGraduatedInfo));

      if (dataGraduatedInfo.countryId == "860" &&
          dataGraduatedInfo.eduTypeId == "4") {
        boolUzbekGraduated = true;
        boolGraduatedType = false;

        graduatedEduTypeId = dataGraduatedInfo.eduTypeId??"4";

        graduatedEduTypeName = listForGet[dataGraduatedInfo.eduTypeId??4-1].name.toString();
        graduatedCountryName = dataGraduatedInfo.countryName.toString();
        graduatedCountryId = dataGraduatedInfo.countryId.toString();
        graduatedRegionName = dataGraduatedInfo.regionName.toString();
        graduatedRegionId = dataGraduatedInfo.regionId.toString();
        graduatedDistrictName = dataGraduatedInfo.districtName.toString();
        graduatedDistrictId = dataGraduatedInfo.districtId.toString();
        graduatedEduName = dataGraduatedInfo.gName.toString();
        graduatedEduId = dataGraduatedInfo.eduTypeId.toString();
        graduatedEduYear = dataGraduatedInfo.graduatedYear.toString();
        graduatedEduSerNum = dataGraduatedInfo.docSerNum.toString();
        notifyListeners();
      }
      else if (dataGraduatedInfo.eduTypeId != "4" && dataGraduatedInfo.eduTypeId != null ) {
        boolGraduatedType = true;
        graduatedEduTypeName = listForGet[(dataGraduatedInfo.eduTypeId??4)-1].name.toString();
        graduatedCountryName = dataGraduatedInfo.countryName.toString();
        graduatedCountryId = dataGraduatedInfo.countryId.toString();
        graduatedRegionName = dataGraduatedInfo.regionName.toString();
        graduatedRegionId = dataGraduatedInfo.regionId.toString();
        graduatedDistrictName = dataGraduatedInfo.districtName.toString();
        graduatedDistrictId = dataGraduatedInfo.districtId.toString();
        graduatedEduName = dataGraduatedInfo.gName.toString();
        graduatedEduId = dataGraduatedInfo.eduTypeId.toString();
        graduatedEduYear = dataGraduatedInfo.graduatedYear.toString();
        graduatedEduSerNum = dataGraduatedInfo.docSerNum.toString();
        textEditingSerNumber.text = dataGraduatedInfo.docSerNum.toString();
        notifyListeners();
        log("#22");
        boolUzbekGraduated = true;
        // if (dataGraduatedInfo.eduTypeId == "4") {
        //   boolGraduatedType = false;
        // } else {
        //   boolGraduatedType = true;
        // }
        // graduatedEduTypeName = listForGet[dataGraduatedInfo.eduTypeId??4-1].name.toString();
        // graduatedEduTypeId = dataGraduatedInfo.eduTypeId??"4";
        // graduatedCountryName = dataGraduatedInfo.countryName.toString();
        // graduatedCountryId = dataGraduatedInfo.countryId.toString();
        // graduatedRegionName = dataGraduatedInfo.regionName.toString();
        // graduatedRegionId = dataGraduatedInfo.regionId.toString();
        // graduatedDistrictName = dataGraduatedInfo.districtName.toString();
        // graduatedDistrictId = dataGraduatedInfo.districtId.toString();
        // graduatedEduName = dataGraduatedInfo.gName.toString();
        // graduatedEduId = dataGraduatedInfo.eduTypeId.toString();
        // graduatedEduYear = dataGraduatedInfo.docSerNum.toString();
        // graduatedEduSerNum = dataGraduatedInfo.docSerNum.toString();

        notifyListeners();
      } else {
        log("#33");
        boolUzbekGraduated = false;
        boolGraduatedType = false;

        graduatedEduTypeId = dataGraduatedInfo.eduTypeId.toString();
        graduatedEduTypeName = listForGet[(dataGraduatedInfo.eduTypeId??4)-1].name.toString();
        graduatedCountryName = dataGraduatedInfo.countryName.toString();
        graduatedCountryId = dataGraduatedInfo.countryId.toString();
        graduatedRegionId = dataGraduatedInfo.regionId.toString();
        graduatedRegionName = dataGraduatedInfo.regionName.toString();
        txtControllerGraduatedName.text =  dataGraduatedInfo.gName.toString();

        graduatedDistrictId = dataGraduatedInfo.id.toString();
        graduatedDistrictName = dataGraduatedInfo.districtName.toString();
        graduatedEduId = "";
        graduatedEduName = dataGraduatedInfo.gName.toString();
        graduatedId = dataGraduatedInfo.eduTypeId.toString();
        graduatedEduYear = dataGraduatedInfo.graduatedYear.toString();
        textEditingSerNumber.text = dataGraduatedInfo.docSerNum.toString();
        notifyListeners();
      }
    } catch (e) {


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
      if (values.name.toLowerCase().contains(value.toLowerCase())) {
        log(jsonEncode(values));
        listGraduatedCountryTemp.add(values);
      } else {
        log(jsonEncode(values));
      }
    }
    notifyListeners();
  }
  bool boolSelectUzb = false;

  Future setForeign({required String name, required String id}) async {

    // graduatedEduTypeId = "";
    // graduatedEduTypeName = "";
    graduatedCountryId = "";
    graduatedCountryName = "";
    graduatedRegionId = "";
    graduatedRegionName = "";
    graduatedDistrictName = "";
    graduatedDistrictId = "";
    graduatedEduId = "";
    graduatedEduName = "";
    graduatedEduYear = "";
    graduatedEduSerNum = "";
    txtControllerGraduatedName.text =  "";
    textEditingSerNumber.text = "";
    graduatedCountryName = name;
    graduatedCountryId = id;

    if (graduatedCountryId == "860") {
      boolSelectUzb = true;
    } else {
      boolSelectUzb = false;
    }
    notifyListeners();

  }

  ///

  String graduatedEduTypeId = "";
  String graduatedEduTypeName = "";
  String graduatedCountryId = "";
  String graduatedCountryName = "";
  String graduatedRegionId = "";
  String graduatedRegionName = "";
  String graduatedDistrictName = "";
  String graduatedDistrictId = "";
  String graduatedEduId = "";
  String graduatedEduName = "";
  String graduatedEduYear = "";
  String graduatedEduSerNum = "";

  /// region
  TextEditingController txtEditControllerSearch = TextEditingController();
  List<DataGetCountry> listGetCountryTemp = [];
  NetworkGetRegion networkGetRegion = NetworkGetRegion();
  late ModelGetCountry modelGetCountry;
  bool boolGetRegion = false;

  Future getRegion({required BuildContext context}) async {
    try {
      boolGetRegion = false;

      String dataCountry = await networkGetRegion.getRegions();
      modelGetCountry = ModelGetCountry.fromJson(jsonDecode(dataCountry));
      log(dataCountry);
      listGetCountryTemp.clear();
      listGetCountryTemp.addAll(modelGetCountry.data);
      boolGetRegion = true;
      notifyListeners();
    } catch (e) {}
  }

  Future searchRegion({required String value}) async {
    listGetCountryTemp.clear();
    for (var element in modelGetCountry.data) {
      if (element.name
          .trim()
          .toLowerCase()
          .contains(value.trim().toLowerCase())) {
        listGetCountryTemp.add(element);
      }
    }
    notifyListeners();
  }

  Future clearCloseRegionSheet() async {
    listGetCountryTemp.clear();
    listGetCountryTemp.addAll(modelGetCountry.data);
    txtEditControllerSearch.clear();
    notifyListeners();
  }

  Future setProvince({required String pronId, required String proName}) async {
    graduatedRegionId = pronId;
    graduatedRegionName = proName;
    graduatedDistrictName = "";
    graduatedDistrictId = "";
    graduatedDistrictName = "";
    graduatedDistrictId = "";
    graduatedEduId = "";
    graduatedEduName = "";
    graduatedEduYear = "";
    graduatedEduSerNum = "";
    textEditingSerNumber.text = "";
    txtControllerGraduatedName.text = "";
    setGraduatedYear = "";

    notifyListeners();
  }

  /// district

  NetworkDistrict networkDistrict = NetworkDistrict();
  late ModelGetDistrict modelGetDistrict;
  List<DataGetDistrict> listGetDistrict = [];
  List<DataGetDistrict> listGetDistrictTemp = [];
  bool boolGetDistrict = false;
  TextEditingController txtDistrictController = TextEditingController();

  Future getDistrict({required String parentId}) async {
    try {
      boolGetDistrict = false;
      String data = await networkDistrict.getDistricts(parentId: parentId);
      modelGetDistrict = ModelGetDistrict.fromJson(jsonDecode(data));
      listGetDistrict = modelGetDistrict.data;
      listGetDistrictTemp.clear();
      listGetDistrictTemp.addAll(listGetDistrict);
      boolGetDistrict = true;
      notifyListeners();
    } catch (e) {}
  }

  Future searchDistrict({required String value}) async {
    listGetDistrictTemp.clear();
    for (var val in listGetDistrict) {
      if (val.name.trim().toLowerCase().contains(value.trim().toLowerCase())) {
        listGetDistrictTemp.add(val);
      }
    }

    notifyListeners();
  }

  Future clearTextDistrict() async {
    boolGetDistrict = false;
    notifyListeners();
    listGetDistrictTemp.clear();
    txtDistrictController.clear();
    listGetDistrictTemp.addAll(listGetDistrict);
    boolGetDistrict = true;
    notifyListeners();
  }

  Future setDistrict({required String distId, required String distName}) async {
    graduatedDistrictName = distName;
    graduatedDistrictId = distId;
    graduatedEduId = "";
    graduatedEduName = "";
    graduatedEduYear = "";
    graduatedEduSerNum = "";
    textEditingSerNumber.text = "";
    txtControllerGraduatedName.text = "";
    setGraduatedYear = "";
    notifyListeners();
  }

  /// Graduated name
  NetworkGetGraduatedNames networkGetGraduatedNames =
      NetworkGetGraduatedNames();
  late ModelGetGraduatedName modelGetGraduatedName;
  late ModelGetGraduatedNameError modelGetGraduatedNameError;
  List<DataGetGraduatedName> listGetName = [];
  List<DataGetGraduatedName> listGetNameTemp = [];
  bool boolGetGraduatedName = false;
  bool boolGetGraduatedNameError = false;
  TextEditingController txtGraduatedNameController = TextEditingController();

  Future getGraduatedName() async {
    try {


      boolGetGraduatedName = false;
      boolGetGraduatedNameError = false;
      String data = await networkGetGraduatedNames.getAllGraduatedName(
          districtId: graduatedDistrictId, gEduType: graduatedEduTypeId);
      modelGetGraduatedName = ModelGetGraduatedName.fromJson(jsonDecode(data));
      listGetName = modelGetGraduatedName.data;
      listGetNameTemp.clear();
      listGetNameTemp.addAll(listGetName);
      boolGetGraduatedName = true;
      notifyListeners();
    } catch (e) {
      boolGetGraduatedName = false;
      String data = await networkGetGraduatedNames.getAllGraduatedName(
          districtId: graduatedDistrictId, gEduType: graduatedEduTypeId);
      modelGetGraduatedNameError =
      ModelGetGraduatedNameError.fromJson(jsonDecode(data));
      boolGetGraduatedNameError = true;
      boolGetGraduatedName = true;


      log(e.toString());
    }
  }

  Future searchGraduatedName({required String value}) async {
    listGetNameTemp.clear();
    for (var val in listGetName) {
      if (val.name.trim().toLowerCase().contains(value.trim().toLowerCase())) {
        listGetNameTemp.add(val);
      }
    }
    notifyListeners();
  }

  Future clearTextGraduatedName() async {
    boolGetGraduatedName = false;
    notifyListeners();
    listGetNameTemp.clear();
    txtGraduatedNameController.clear();
    listGetNameTemp.addAll(listGetName);
    boolGetGraduatedName = true;
    notifyListeners();
  }

  Future setGraduatedName(
      {required String grdNameId, required String gradName}) async {
    graduatedEduId = grdNameId;
    graduatedEduName = gradName;
    notifyListeners();
  }

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

      boolGraduatedYear = false;
      String dataGraduated = await networkGraduatedYear.getYear();
      ModelGraduatedYear modelGraduatedYear =
          ModelGraduatedYear.fromJson(jsonDecode(dataGraduated));
      listGraduatedYear.clear();
      for (int i = int.parse(modelGraduatedYear.data.endYear);
          i >= int.parse(modelGraduatedYear.data.beginYear);
          i--) {

        listGraduatedYear.add("$i-${"year".tr()}");
      }
      // listGraduatedYearTemp.clear();
      listGraduatedYearTemp = listGraduatedYear;
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
    graduatedEduYear = id;
    notifyListeners();
  }

  Future setGraduatedType({required String name, required String id}) async {

    graduatedEduTypeName = name;
    graduatedEduTypeId = id;

    graduatedRegionId = "";
    graduatedRegionName = "";
    graduatedDistrictName = "";
    graduatedDistrictId = "";
    graduatedEduId = "";
    graduatedEduName = "";
    graduatedEduYear = "";
    graduatedEduSerNum = "";
    textEditingSerNumber.text = "";
    txtControllerGraduatedName.text ="";
    setGraduatedYear = "";



    if (graduatedEduTypeId == "4") {
      boolGraduatedType = false;
    } else {
      boolGraduatedType = true;
    }
    notifyListeners();
  }


  ///
  NetworkSetServer networkSetServer = NetworkSetServer();
  late DataEduGraduated dataEduGraduated;
  Future sentServerGraduatedAll({
    String? eduType,
    String? regionId,
    String? districtId,
    String? eduListId,
    String? graduatedYear,
    String? docSerNum,
    String? eduName,
    String? countryId,
    required BuildContext context
  })async{

    Map<String, String> sentEduMap = {
      "edu_type":eduType??"0",
      "region_id":regionId??"1726",
      "district_id":districtId??"0",
      "edu_list_id":eduListId??"0",
      "graduated_year":graduatedYear.toString().substring(0,4),
      "doc_ser_num":docSerNum??"0",
      "edu_name":eduName??"0",
      "country_id":countryId??"0"
    };

    boolAllInfoGraduated = false;
    notifyListeners();
    String data = await networkSetServer.getSetAllGraduated(allData: jsonEncode(sentEduMap));
    log(data);
    ModelEduGraduated modelEduGraduated = ModelEduGraduated.fromJson(jsonDecode(data));
    dataEduGraduated = modelEduGraduated.data;
    boolAllInfoGraduated = true;
    notifyListeners();


  graduatedEduTypeName = listForGet[int.parse(dataEduGraduated.eduTypeId.toString()) -1].name;
  graduatedEduTypeId = dataEduGraduated.eduTypeId.toString();
  graduatedRegionId = dataEduGraduated.regionId.toString();
  graduatedRegionName = dataEduGraduated.regionName;
  graduatedDistrictName = dataEduGraduated.districtName.toString();
  graduatedDistrictId = dataEduGraduated.districtId.toString();
  graduatedEduId = dataEduGraduated.oldeduId.toString();
  graduatedEduName = dataEduGraduated.gName.toString();
  graduatedEduYear = dataEduGraduated.graduatedYear.toString();
  graduatedEduSerNum = dataEduGraduated.docSerNum.toString();
  textEditingSerNumber.text = dataEduGraduated.docSerNum.toString();
  txtControllerGraduatedName.text =dataEduGraduated.gName.toString();
  setGraduatedYear = dataEduGraduated.graduatedYear.toString();

    //MyWidgets.awesomeDialogInfo(context: context, valueText: "Ma'lumot saqlandi");
    AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOMSLIDE,
        title: "DTM",
        desc: "Ma'lumot saqlandi",
        titleTextStyle: TextStyle(
            color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
        descTextStyle: TextStyle(
            color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
        btnCancelOnPress: () {
          Navigator.of(context).pop();
        },
        btnCancelText: "OK")
        .show();
    notifyListeners();
    // {
    // "edu_type":2,
    // "region_id":1703,
    // "district_id":1703401,
    // "edu_list_id":211766,
    // "graduated_year":2008,
    // "doc_ser_num":"L1234567",
    // "edu_name":"salom",
    // "country_id":"860"
    // }

  }

  ///

}
