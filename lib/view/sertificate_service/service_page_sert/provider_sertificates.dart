// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/certificate_nation/create_nat_cert.dart';
import 'package:mydtm/data/internet_connections/certificate_nation/get_regLang.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/model_create_cert.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/model_passport.dart';
import 'package:mydtm/view/sertificate_service/service_pages/sertificate_view.dart';
import 'package:mydtm/view/sertificate_service/widget_cert_nation/list_choose_lang.dart';
import 'package:mydtm/view/sertificate_service/widget_cert_nation/list_choose_regions.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';

class ProviderCertificateService extends ChangeNotifier {
  // List<ModelCertNationRegion> listCerRegions = [];
  Map<String, String> mapReg = {};
  Map<String, String> mapLang = {};
  String globNatCert = "";
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
    globNatCert = natCertId;
    notifyListeners();
  }

  bool boolGetCertLang = false;

  Future getLangCertificate({
    required String certId,
    required BuildContext context,
    required ProviderCertificateService providerCertificateService,
  }) async {
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
          return ListChooseLangs(
              listCerLang: mapLang,
              providerCertificateService: providerCertificateService);
        });
  }

  String regName = "", regId = "";

  Future setNameRegion({required String name, required String id}) async {
    regName = name;
    regId = id;
    notifyListeners();
  }

  String certLangName = "", certLangId = "";

  Future setCertLang({required String name, required String id}) async {
    certLangName = name;
    certLangId = id;
    notifyListeners();
  }

  NetworkCreateCertNation networkCreateCertNation = NetworkCreateCertNation();
  late String resultData;
  bool boolCreateCertification = false;
  late DataCreateCert dataCreateCert;

  Future createCert({required BuildContext context, required String serName, required String subId  }) async {
    // NetworkCreateCertNation
    boolCreateCertification = false;
    try{
    resultData = await networkCreateCertNation.getNatCert(
        testLangId: certLangId, testRegion: regId, natCerId: globNatCert);

    dataCreateCert = ModelCreateCert.fromJson(jsonDecode(resultData)).data;
    boolCreateCertification = true;
    getCertIfHas(certId: subId, context: context, sername: serName);
    notifyListeners();
    log(resultData);}
        catch(e){
      try      {
        ModelPassport modelPassport =
            ModelPassport.fromJson(jsonDecode(resultData));
        MyWidgets.awesomeDialogInfo(context: context, valueText: modelPassport.errors.toString());
      }catch(e){
        MyWidgets.awesomeDialogInfo(context: context, valueText: "infoFillError".tr());
      }
    }
  }

  getCertIfHas(
      {required BuildContext context,
      required String certId, // sertifikat idsi
      required String sername // sertifikat nomi
      }) {
    try {
      pushNewScreen(context,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
          screen: CertificateApplication(
            serviceId: certId,
            certName: sername,
          ));
    } catch (e) {
      log(e.toString());
    }
  }
}
