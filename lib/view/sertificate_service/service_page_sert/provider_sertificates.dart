import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/certificate_nation/get_regions.dart';
import 'package:mydtm/view/sertificate_service/widget_cert_nation/list_choose_regions.dart';

class ProviderCertificateService extends ChangeNotifier {
  // List<ModelCertNationRegion> listCerRegions = [];
  Map<String, String> mapReg = {};
  Map<String, String> mapLang = {};
  NetworkGetRegionCertNation getRegionCertNation = NetworkGetRegionCertNation();
  bool boolGetSerRegion = false;

  Future getDateServiceCertificate(
      {required BuildContext context,
      required ProviderCertificateService providerCertificateService,
      required String natCertId}) async {
    boolGetSerRegion = false;
    mapReg = await getRegionCertNation.getRegion(natCerId: natCertId);
    log(mapReg.toString());
    boolGetSerRegion = true;
    getButtonSheet(
        context: context,
        providerCertificateService: providerCertificateService);
    notifyListeners();
  }


  bool boolGetCertLang = false;

  Future getLangCertificate({required String certId,
    required BuildContext context,
    required ProviderCertificateService providerCertificateService,
  })async{
    boolGetSerRegion = false;
    mapLang = await getRegionCertNation.getLanguage(natCerId: certId);

    boolGetSerRegion = true;
    getButtonSheetNationCertReg(
        context: context,
        providerCertificateService: providerCertificateService);
    notifyListeners();
  }


  Future getButtonSheet(
      {required BuildContext context,
      required ProviderCertificateService providerCertificateService}) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return ListChooseRegions(
              listCerRegions: mapReg,
              providerCertificateService: providerCertificateService);
        });
  }



  Future getButtonSheetNationCertReg(
      {required BuildContext context,
        required ProviderCertificateService providerCertificateService}) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return ListChooseRegions(
              listCerRegions: mapLang,
              providerCertificateService: providerCertificateService);
        });
  }


  String? regName, regId;

  Future setNameRegion({required String name, required String id}) async {
    regName = name;
    regId = id;
    notifyListeners();
  }
}
