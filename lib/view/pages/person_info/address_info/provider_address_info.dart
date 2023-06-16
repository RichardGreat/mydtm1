// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_address.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_district.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_region.dart';
import 'package:mydtm/data/internet_connections/person_info/set_address.dart';
import 'package:mydtm/data/model_parse/m6_model/district.dart';
import 'package:mydtm/data/model_parse/m6_model/get_address.dart';
import 'package:mydtm/data/model_parse/m6_model/get_country.dart';
import 'package:mydtm/data/model_parse/person_info/model_address.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProviderAddressInfo extends ChangeNotifier {
  final keyAddressInfo = GlobalKey<FormState>();

  TextEditingController txtEditControllerAddress = TextEditingController();

  late String provinceId = "",
      districtId = "",
      provinceName = "",
      districtName = "",
      address = "";

  /// Get Address
  NetworkGetAddressInfo networkGetAddressInfo = NetworkGetAddressInfo();
  late ModelGetAddressInfo modelGetAddressInfo;

  bool boolGetAddressInfo = false;

  Future getAddressInfo() async {
    try {
      boolGetAddressInfo = false;
      String dataAddressInfo = await networkGetAddressInfo.getAddressInfo();
      modelGetAddressInfo =
          ModelGetAddressInfo.fromJson(jsonDecode(dataAddressInfo));
      log(dataAddressInfo);
      provinceId = modelGetAddressInfo.data.regionId.toString();
      districtId = modelGetAddressInfo.data.districtId.toString();
      provinceName = modelGetAddressInfo.data.regionName;
      districtName = modelGetAddressInfo.data.districtName;
      txtEditControllerAddress.text = modelGetAddressInfo.data.address;
      if (txtEditControllerAddress.text.length > 3) {
        boolAddressText = true;
      } else {
        boolAddressText = true;
        notifyListeners();
      }
      boolGetAddressInfo = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      boolGetAddressInfo = true;
      notifyListeners();
    }
  }

  /// Country

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
    } catch (e) {log(e.toString());}
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

  /// provider text
  bool boolAddressText = false;

  Future boolAddress({required bool boolAd}) async {
    boolAddressText = boolAd;
  }

  /// Viloyat

  Future setProvince({required String pronId, required String proName}) async {
    provinceName = proName;
    provinceId = pronId;
    districtId = "";
    districtName = "";
    txtEditControllerAddress.text = "";
    address = "";

    getDistrict(parentId: pronId);

    notifyListeners();
  }

  /// tuman
  ///
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
    } catch (e) {log(e.toString());}
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

  ///
  Future setDistrict({required String distId, required String distName}) async {
    districtName = distName;
    districtId = distId;
    notifyListeners();
  }

  NetworkSetAddress networkSetAddress = NetworkSetAddress();

  Future setAddress({required BuildContext context, required String windowsIdAddress}) async {
    boolGetAddressInfo = false;
    notifyListeners();

    Map<String, String> mapAddress = {
      "region_id": provinceId,
      "district_id": districtId,
      "address": txtEditControllerAddress.text
    };

    try {
      if(modelGetAddressInfo.data.address.isEmpty) {
      String dataSetAddress = await networkSetAddress.setAddressInfo(
          setAddressInfos: jsonEncode(mapAddress));
      ModelGetAddress modelGetAddress =
          ModelGetAddress.fromJson(jsonDecode(dataSetAddress));
      provinceId = modelGetAddress.data.regionId.toString();
      districtId = modelGetAddress.data.districtId.toString();
      provinceName = modelGetAddress.data.regionName;
      districtName = modelGetAddress.data.districtName;
      address = modelGetAddress.data.address;

      boolGetRegion = true;
      notifyListeners();}

      boolGetAddressInfo = true;
          AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.bottomSlide,
          dismissOnTouchOutside: false,
          title: "BMBA",
          desc: "saved".tr(),
          titleTextStyle: TextStyle(
              color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
          descTextStyle: TextStyle(
              color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),

              btnCancelOnPress: () {
            pushNewScreen(context,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                screen: Graduated(funcState: getActions,  windowIdGraduated: windowsIdAddress), withNavBar: false);
          },
              btnCancelColor: MyColors.appColorBlue1(),
          btnCancelText: "continue".tr(),)
          .show();

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
  Future getActions()async{}
}
