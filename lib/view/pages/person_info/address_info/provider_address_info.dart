import 'package:flutter/cupertino.dart';


class  ProviderAddressInfo extends ChangeNotifier{

  final keyAddressInfo = GlobalKey<FormState>();

  TextEditingController txtEditControllerAddress = TextEditingController();

  /// provider text
  bool boolAddressText = false;
  Future boolAddress({required bool boolAd})async{
    boolAddressText = boolAd;
  }

  /// Viloyat
  String provinceName = "", provinceId = "";
  Future setProvince({required String pronId, required String proName})async{
    provinceName = proName;
    provinceId = pronId;
    notifyListeners();
  }

  /// tuman
  String districtName = "", districtId = "";
  Future setDistrict({required String distId, required String distName})async{
    districtName = distName;
    districtId = distId;
    notifyListeners();
  }
}