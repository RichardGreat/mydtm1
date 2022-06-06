import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_address.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_district.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_region.dart';
import 'package:mydtm/data/model_parse/m6_model/district.dart';
import 'package:mydtm/data/model_parse/m6_model/get_address.dart';
import 'package:mydtm/data/model_parse/m6_model/get_country.dart';

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
  ///
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
      if (element.name.trim().toLowerCase().contains(value.trim().toLowerCase())) {
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

  Future clearTextDistrict()async  {
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
}
