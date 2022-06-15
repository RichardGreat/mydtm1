// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/edu_choose/edu_lang/lang_choose_edu.dart';
import 'package:mydtm/data/internet_connections/edu_choose/edu_lang/test_lang.dart';
import 'package:mydtm/data/internet_connections/edu_choose/emode/emode_choose.dart';
import 'package:mydtm/data/internet_connections/edu_choose/otm/dir1.dart';
import 'package:mydtm/data/internet_connections/edu_choose/otm/otm_1.dart';
import 'package:mydtm/data/internet_connections/edu_choose/region/choose_region.dart';
import 'package:mydtm/data/internet_connections/edu_choose/sent_server/send_server.dart';
import 'package:mydtm/data/model_parse/edu_choose/emode/emodes.dart';
import 'package:mydtm/data/model_parse/edu_choose/lang/lang_edu_model.dart';
import 'package:mydtm/data/model_parse/edu_choose/lang/test_lang.dart';
import 'package:mydtm/data/model_parse/edu_choose/model_edu_dir.dart';
import 'package:mydtm/data/model_parse/edu_choose/otm/dir.dart';
import 'package:mydtm/data/model_parse/edu_choose/otm/otm.dart';
import 'package:mydtm/data/model_parse/edu_choose/region.dart';
import 'package:mydtm/data/model_parse/person_info/certificate/for_server.dart';
import 'package:mydtm/data/model_parse/person_info/certificate/national_cert.dart';
import 'package:mydtm/data/model_parse/send_server/model_sms2.dart';
import 'package:mydtm/data/model_parse/send_server/send_server.dart';
import 'package:mydtm/view/pages/otm/widgets/select_direction/otm/dir.dart';
import 'package:mydtm/view/pages/otm/widgets/select_direction/otm/otm.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/ui/s3_body_sms_auto_fill.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../data/internet_connections/person_info/certificate/national_certificate.dart';

class ProviderChooseEdu extends ChangeNotifier {
  late String testRegionId = "";

  /// Check Use Certificate

  NetworkNationalCert networkNationalCert = NetworkNationalCert();
  List<DataCheckCertificate> listCheckCertificate = [];
  bool boolCheckUseCertificateData = false;
  bool boolCheckUseCertificateDataNot = false;
  List<ModelCertificateForServer> listCertificateCheckUse = [];

  Future getCheckUseNationCertInfo() async {
    try {
      boolCheckUseCertificateData = false;
      String dataCert = await networkNationalCert.getNationalCert();
      log(dataCert);
      ModelCheckCertificate modelCheckCertificate =
          ModelCheckCertificate.fromJson(jsonDecode(dataCert));
      listCheckCertificate = modelCheckCertificate.data;
      for (int i = 0; i < listCheckCertificate.length; i++) {
        listCertificateCheckUse.add(ModelCertificateForServer(
          certId: "-1",
          userValue: listCheckCertificate[i].certSernum.toString(),
          certBall: listCheckCertificate[i].percent.toString(),
          certName: listCheckCertificate[i].name.toString(),
          cerId: listCheckCertificate[i].id.toString(),
          isChecked: listCheckCertificate[i].isCheck.toString()
        ));
      }
      log(jsonEncode(listCertificateCheckUse));
      boolCheckUseCertificateData = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      boolCheckUseCertificateData = true;
      boolCheckUseCertificateDataNot = true;
      notifyListeners();
    }
  }
   Map<String, String> mapCert = {};
  Future setUserNationCert(
      {required int indexId,required String certId, required int userVal}) async {
    log("certId $certId");
    log("userVal.toString() $userVal");
    log("indexId $indexId");
    listCertificateCheckUse[indexId].certId =  userVal.toString();
    mapCert = {for (var item in listCertificateCheckUse) item.cerId : item.certId};
    log(jsonEncode(mapCert));
    // for(var l in listCertificateCheckUse){
    //   log(l.cerId);
    //   log(l.certId);
    // }
    notifyListeners();
  }

  /// Choose direction
  //#Bloc1
  // Choose region
  NetworkEduChooseRegion networkChooseEduRegion = NetworkEduChooseRegion();
  late ModelEduChooseRegion modelEduChooseRegion;
  Map<String, String> mapModelEduChoose = {};
  List<ListModelEduChooseRegion> listEduChooseRegion = [];
  List<ListModelEduChooseRegion> listEduChooseRegionTemp = [];
  TextEditingController textSearchRegionEduChoose = TextEditingController();
  bool boolEduChoose = false;

  Future getChooseRegion(
      {required BuildContext context,
      required ProviderChooseEdu providerChooseEdu}) async {
    boolEduChoose = false;
    String data = await networkChooseEduRegion.getChooseEduRegion();
    modelEduChooseRegion = ModelEduChooseRegion.fromJson(jsonDecode(data));
    mapModelEduChoose = modelEduChooseRegion.data;
    listEduChooseRegion.clear();
    listEduChooseRegion = mapModelEduChoose.entries
        .map((entry) => ListModelEduChooseRegion(
              regionId: entry.key.toString(),
              regionName: entry.value,
            ))
        .toList();
    listEduChooseRegionTemp.clear();
    listEduChooseRegionTemp.addAll(listEduChooseRegion);
    boolEduChoose = true;
    notifyListeners();
  }

  Future searchRegionEduChoose({required String value}) async {
    listEduChooseRegionTemp.clear();
    for (var val in listEduChooseRegion) {
      if (val.regionName
          .toString()
          .toLowerCase()
          .contains(value.trim().toLowerCase())) {
        listEduChooseRegionTemp.add(val);
      }
    }
    notifyListeners();
  }

  Future clearTextEduChooseRegion() async {
    boolEduChoose = false;
    notifyListeners();
    listEduChooseRegionTemp.clear();
    textSearchRegionEduChoose.clear();
    listEduChooseRegionTemp.addAll(listEduChooseRegion);
    boolEduChoose = true;
    notifyListeners();
  }

  String testRegionNames = "";

  Future setTestRegion(
      {required String regionId, required String regionName}) async {
    await Future.delayed(Duration.zero);
    setDefaultEduDir();
    testRegionId = regionId;
    testRegionNames = regionName;
    notifyListeners();
  }

//#Bloc2
// Choose Language test

  NetworkEduLangEduChoose networkEduLangEduChooseTest =
      NetworkEduLangEduChoose();
  late ModelLangEduChoose modelLangEduChooseTest;
  List<DataLangEduChoose> listLangEduChooseTest = [];
  List<DataLangEduChoose> listLangEduChooseTestTemp = [];
  TextEditingController textLangEduChooseTestController =
      TextEditingController();
  bool boolLangEduTest = false;

  Future getLangEduChooseTest(
      {required BuildContext context,
      required ProviderChooseEdu providerChooseEdu}) async {
    boolLangEduTest = false;
    String dataLangEduTest =
        await networkEduLangEduChooseTest.getLangEduChoose();
    modelLangEduChooseTest =
        ModelLangEduChoose.fromJson(jsonDecode(dataLangEduTest));
    listLangEduChooseTest.clear();
    listLangEduChooseTest.addAll(modelLangEduChooseTest.data);
    listLangEduChooseTestTemp.clear();
    listLangEduChooseTestTemp.addAll(listLangEduChooseTest);
    boolLangEduTest = true;
    notifyListeners();
  }

  Future searchLangEduChooseTest({required String value}) async {
    listLangEduChooseTestTemp.clear();
    for (var val in listLangEduChooseTest) {
      if (val.name
          .toString()
          .toLowerCase()
          .contains(value.trim().toLowerCase())) {
        listLangEduChooseTestTemp.add(val);
      }
    }
    notifyListeners();
  }

  Future clearTextLangEduChoose() async {
    boolLangEduTest = false;
    notifyListeners();
    listLangEduChooseTestTemp.clear();
    textLangEduChooseTestController.clear();
    listLangEduChooseTestTemp.addAll(listLangEduChooseTest);
    boolLangEduTest = true;
    notifyListeners();
  }

  String langId = "";
  String langName = "";

  Future setLanguage({required String name, required String id}) async {
    setDefaultEduDir();
    langName = name;
    langId = id;
    log(langId + langName);
    notifyListeners();
  }

  String langGraphicId = "0";
  String langGraphicName = "Lotin";

  Future setLanguageGraphic({required String name, required String id}) async {
    setDefaultEduDir();
    langGraphicId = id;
    langGraphicName = name;
    notifyListeners();
  }

//#Bloc3
// Choose Grant Contract
  List<String> listGrantContract = ["grant".tr(), "contract".tr()];

  String grantContractName = "";
  String grantContractId = "";

  Future setGrantContract({required String id, required String name}) async {
    setDefaultEduDir();
    grantContractId = id;
    grantContractName = name;
    notifyListeners();
  }

  //#Bloc31
  // Maqsadli maqsadsiz
  List<String> listmaqsadli = [
    "aimless".tr(),
    "targeted".tr(),
  ];
  String maqsadliId = "";
  String maqsadliName = "";

  Future setMaqsadli({required String id, required String name}) async {
    setDefaultEduDir();
    maqsadliId = id;
    maqsadliName = name;
    print("$maqsadliName  $maqsadliId");
    notifyListeners();
  }

// #Bolc4
//  choose emode

  /// Yuqoridagilardan biri qayta tanlansa pastni to'liq tozalash kerak
  Future setDefaultEduDir() async {
    boolForeignLang = false;
    for (int i = 0; i < listTitleEduDir.length; i++) {
      listTitleEduDir[i] = ListModelEduDir(
          id: "",
          nameTitle: "",
          titleId: "$i",
          nameEdu: "",
           emode: "",
          emodeName: "",
          eduId: "",
          dirName: "",
          dirId: "",
          fLangId: "");
    }
    // Oliy ta'lim muassasi
    for (int i = 0; i < listTitleEduDir.length; i++) {
      listTitleEduDir[i] = ListModelEduDir(
          id: "$i",
          nameTitle: "Oliy ta'lim muassasi",
          titleId: "$i",
          nameEdu: "",
           emode: "",
          emodeName: "",
          eduId: "",
          dirName: "",
          dirId: "",
          fLangId: "");
    }
    notifyListeners();
  }

  List<String> listTitleName = [
    "Oliy ta'lim muassasi",
    "Oliy ta'lim muassasi",
    "Oliy ta'lim muassasi",
    "Oliy ta'lim muassasi",
    "Oliy ta'lim muassasi"
  ];

  List<ListModelEduDir>  listTitleEduDir = [
    ListModelEduDir(
      id: "0",
      nameTitle: "Oliy ta'lim muassasi",
      titleId: "0",
       emode: "",

      emodeName: "",
      nameEdu: "",
      eduId: "",
      dirName: "",
      dirId: "",
      fLangId: "",
    ),
    ListModelEduDir(
      id: "1",
      nameTitle: "Oliy ta'lim muassasi",
      titleId: "1",
       emode: "",
      emodeName: "",
      nameEdu: "",
      eduId: "",
      dirName: "",
      dirId: "",
      fLangId: "",
    ),
    ListModelEduDir(
      id: "2",
      nameTitle: "Oliy ta'lim muassasi",
      titleId: "2",
      nameEdu: "",
       emode: "",
      emodeName: "",
      eduId: "",
      dirName: "",
      dirId: "",
      fLangId: "",
    ),
    ListModelEduDir(
      id: "3",
      nameTitle: "Oliy ta'lim muassasi",
      titleId: "3",
      nameEdu: "",
       emode: "",
      emodeName: "",
      eduId: "",
      dirName: "",
      dirId: "",
      fLangId: "",
    ),
    ListModelEduDir(
      id: "4",
      nameTitle: "Oliy ta'lim muassasi",
      titleId: "4",
      nameEdu: "",
       emode: "",
      emodeName: "",
      eduId: "",
      dirName: "",
      dirId: "",
      fLangId: "",
    ),
  ];

  NetworkEmodeChoose networkEmodeChoose = NetworkEmodeChoose();
  late ModelEmodeGet modelEmodeGet;
  Map<String, String> modelMapEmodeGet = {};
  List<DataEmodeChoose> listEmodeChoose = [];
  bool boolGetEmode = false;

  Future getEmode() async {
    try {
      boolGetEmode = false;

      String emodeData = await networkEmodeChoose.getEmodeItem(langId: langId);
      modelEmodeGet = ModelEmodeGet.fromJson(jsonDecode(emodeData));

      listEmodeChoose = modelEmodeGet.data.entries
          .map((entry) => DataEmodeChoose(
                id: entry.key,
                name: entry.value,
              ))
          .toList();
      log(jsonEncode(listEmodeChoose));
      boolGetEmode = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  late String emodeData;

  Future getEmode2({required int indexEduDir}) async {
    try {
      boolGetEmode = false;
      if (indexEduDir == 1) {
        emodeData = await networkEmodeChoose.getEmodeItem2(
          langId: langId,
          dirId: listTitleEduDir[indexEduDir - 1].dirId,
          isItem: listTitleEduDir[indexEduDir - 1].dirId,
        );
      } else if (indexEduDir == 2) {
        emodeData = await networkEmodeChoose.getEmodeItem2(
          langId: langId,
          dirId: listTitleEduDir[indexEduDir - 1].dirId,
          isItem: "${listTitleEduDir[indexEduDir - 1].dirId},"
              "${listTitleEduDir[indexEduDir - 2].dirId}",
        );
      } else if (indexEduDir == 3) {
        emodeData = await networkEmodeChoose.getEmodeItem2(
          langId: langId,
          dirId: listTitleEduDir[indexEduDir - 1].dirId,
          isItem: "${listTitleEduDir[indexEduDir - 1].dirId},"
              "${listTitleEduDir[indexEduDir - 2].dirId},"
              "${listTitleEduDir[indexEduDir - 3].dirId}",
        );
      } else if (indexEduDir == 4) {
        emodeData = await networkEmodeChoose.getEmodeItem2(
          langId: langId,
          dirId: listTitleEduDir[indexEduDir - 1].dirId,
          isItem: "${listTitleEduDir[indexEduDir - 1].dirId},"
              "${listTitleEduDir[indexEduDir - 2].dirId},"
              "${listTitleEduDir[indexEduDir - 3].dirId},"
              "${listTitleEduDir[indexEduDir - 4].dirId}",
        );
      }
      log(emodeData);
      modelEmodeGet = ModelEmodeGet.fromJson(jsonDecode(emodeData));
      listEmodeChoose = modelEmodeGet.data.entries
          .map((entry) => DataEmodeChoose(
                id: entry.key,
                name: entry.value,
              ))
          .toList();
      boolGetEmode = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  String eModeName = "";
  String eModeId = "";
  Map<String, String> mapEmode = {};
  Future setEMode(
      {required BuildContext context,
      required ProviderChooseEdu providerChooseEdu,
      required String name,
      required int titleEduDirId,
      required String id,
      required String emodeId
      }) async {
    eModeName = name;
    eModeId = id;
    listTitleEduDir[titleEduDirId].emode = id;
    listTitleEduDir[titleEduDirId].emodeName = eModeName;

    sheetOTMEdu(
        contexts: context,
        providerChooseEdu: providerChooseEdu,
        titleEduDirId: titleEduDirId);
    // 123
    mapEmode = {for (var item in listTitleEduDir) (int.parse(item.id)+1).toString() : item.emode};
    log(jsonEncode(mapCert));

    notifyListeners();
  }

  // #Bloc5 OTM 1
  NetworkOtm networkOtm = NetworkOtm();
  late ModelOtm1 modelOtm1;
  List<DataOTM> listDataOtm = [];
  List<DataOTM> listDataOtmTemp = [];
  TextEditingController textOTMChoose = TextEditingController();

  bool boolOtmData = false;
  late String dataOtm;

  Future getOtm1({required int titleEduDir}) async {
    try {
      boolOtmData = false;
      if (titleEduDir == 0) {
        dataOtm = await networkOtm.getOtm(eModeId: eModeId, langId: langId);
      } else if (titleEduDir == 1) {
        dataOtm = await networkOtm.getOtm2(
            eModeId: eModeId.toString(),
            langId: langId.toString(),
            isItem: listTitleEduDir[titleEduDir - 1].dirId.toString(),
            dirId: listTitleEduDir[titleEduDir - 1].dirId.toString());
      } else if (titleEduDir == 2) {
        dataOtm = await networkOtm.getOtm2(
          eModeId: eModeId,
          langId: langId,
          dirId: listTitleEduDir[titleEduDir - 1].dirId,
          isItem: "${listTitleEduDir[titleEduDir - 1].dirId.toString()}"
              "${listTitleEduDir[titleEduDir - 2].dirId.toString()}",
        );
      } else if (titleEduDir == 3) {
        dataOtm = await networkOtm.getOtm2(
            eModeId: eModeId,
            langId: langId,
            dirId: listTitleEduDir[titleEduDir - 1].dirId,
            isItem: "${listTitleEduDir[titleEduDir - 1].dirId},"
                "${listTitleEduDir[titleEduDir - 2].dirId},"
                "${listTitleEduDir[titleEduDir - 3].dirId}");
      } else if (titleEduDir == 4) {
        dataOtm = await networkOtm.getOtm2(
            eModeId: eModeId,
            langId: langId,
            dirId: listTitleEduDir[titleEduDir - 1].dirId,
            isItem: "${listTitleEduDir[titleEduDir - 1].dirId},"
                "${listTitleEduDir[titleEduDir - 2].dirId},"
                "${listTitleEduDir[titleEduDir - 3].dirId}"
                "${listTitleEduDir[titleEduDir - 4].dirId}");
      }

      //
      log("dataOtm");
      log(dataOtm);
      modelOtm1 = ModelOtm1.fromJson(jsonDecode(dataOtm));
      listDataOtm = modelOtm1.data.entries
          .map((e) => DataOTM(id: e.key, name: e.value))
          .toList();
      listDataOtmTemp.clear();
      listDataOtmTemp.addAll(listDataOtm);
      log(jsonEncode(listDataOtmTemp));
      boolOtmData = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future searchOtm({required String val}) async {
    listDataOtmTemp.clear();
    for (var l in listDataOtm) {
      if (l.name.toLowerCase().contains(val.trim().toLowerCase())) {
        listDataOtmTemp.add(l);
      }
    }
    notifyListeners();
  }

  Future clearTextOtm1() async {
    boolOtmData = false;
    notifyListeners();
    textOTMChoose.clear();
    listDataOtmTemp.clear();
    listDataOtmTemp.addAll(listDataOtm);
    boolOtmData = true;
    notifyListeners();
  }
  Map<String, String> mapOtm = {};
  Future setOtm1(
      {required String name,
      required String id,
      required BuildContext contexts,
      required ProviderChooseEdu providerChooseEdu,
      required int titleEduDirId}) async {
    // listOtmNameId[0] = DataOTM(id: id, name: name);
    listTitleEduDir[titleEduDirId].nameEdu = name;
    listTitleEduDir[titleEduDirId].eduId = id;
    mapOtm  = {for (var item in listTitleEduDir) (int.parse(item.id)+1).toString() : item.eduId};
    sheetDIRdu(
        contexts: contexts,
        providerChooseEdu: providerChooseEdu,
        titleEduDir: titleEduDirId);
    notifyListeners();
  }

  bool boolForeignLang = false;
  Map<String, String> mapDir = {};
  Future setDir1(
      {required String nameDir,
      required String idDir,
      required String fLang,
      required int titleEduDirId}) async {
    listTitleEduDir[titleEduDirId].dirId = idDir;
    listTitleEduDir[titleEduDirId].dirName = nameDir;
    listTitleEduDir[titleEduDirId].fLangId = fLang;
    if (listTitleEduDir[0].fLangId == "0") {
      boolForeignLang = false;
      notifyListeners();
    } else if (listTitleEduDir[0].fLangId == "4") {
      boolForeignLang = true;
      notifyListeners();
    }

    mapDir  = {for (var item in listTitleEduDir) (int.parse(item.id)+1).toString() : item.dirId};

    notifyListeners();
  }

  Future searchDir({required String val}) async {
    listDirTemp.clear();
    for (var l in listDir) {
      if (l.name.toLowerCase().contains(val.trim().toLowerCase())) {
        listDirTemp.add(l);
      }
    }
    notifyListeners();
  }

  Future clearTextDir1() async {
    boolDirDownload = false;
    notifyListeners();
    textDir1Controller.clear();
    listDirTemp.clear();
    listDirTemp.addAll(listDir);
    boolDirDownload = true;
    notifyListeners();
  }

  // #GetForeignLanguage
  NetworkLangTest networkLangTest = NetworkLangTest();
  late ModelLangTest modelLangTest;
  List<DataForeignLang> listDataForeignLang = [];
  List<DataForeignLang> listDataForeignLangTemp = [];
  bool boolForeignLanguage = false;
  String stringForeignLangName = "";
  String stringForeignLangId = "";

  Future getForeignLangMethod() async {
    try {
      boolForeignLanguage = false;
      String dataTestLang =
          await networkLangTest.getTestLang(langId: listTitleEduDir[0].fLangId);
      modelLangTest = ModelLangTest.fromJson(jsonDecode(dataTestLang));
      listDataForeignLang = modelLangTest.data.entries
          .map(
              (key) => DataForeignLang(id: key.key, name: key.value.toString()))
          .toList();

      listDataForeignLangTemp.clear();
      listDataForeignLangTemp = listDataForeignLang;

      boolForeignLanguage = true;
      notifyListeners();
    } catch (e) {}
  }

  bool boolSelectForeignLang = false;

  Future setForeignLang({required String id, required String name}) async {
    boolSelectForeignLang = false;
    stringForeignLangName = name;

    stringForeignLangId = id;
    boolSelectForeignLang = true;
    notifyListeners();
  }

  // #Bloc6 1

  Future getDefault({required int titleEduDir}) async {
    for (int i = titleEduDir + 1; i < listTitleEduDir.length; i++) {
      listTitleEduDir[i] = ListModelEduDir(
          id: i.toString(),
          nameTitle: listTitleName[i],
          titleId: i.toString(),
          nameEdu: "",
           emode: "",
          emodeName: "",
          eduId: "",
          dirName: "",
          dirId: "",
          fLangId: "");
    }
  }

  NetworkDir1 networkDir1 = NetworkDir1();
  late ModelDir1 modelDir1;
  List<DataDir1> listDir = [];
  List<DataDir1> listDirTemp = [];
  bool boolDirDownload = false;
  TextEditingController textDir1Controller = TextEditingController();
  late String dataDir;

  Future getDir1(
      {required int titleEduDir, required BuildContext context}) async {
    try {
      boolDirDownload = false;
      getDefault(titleEduDir: titleEduDir);
      if (titleEduDir == 0) {
        dataDir = await networkDir1.getDir1(
            otmId: listTitleEduDir[0].eduId,
            isMaqsadId: maqsadliId,
            langId: langId,
            emode: eModeId);
      } else if (titleEduDir == 1) {
        dataDir = await networkDir1.getDir2(
            otmId: listTitleEduDir[1].eduId,
            dirId: listTitleEduDir[titleEduDir - 1].dirId,
            isItem: listTitleEduDir[titleEduDir - 1].dirId,
            isMaqsadId: maqsadliId,
            langId: langId,
            emode: eModeId);
      } else if (titleEduDir == 2) {
        dataDir = await networkDir1.getDir2(
            otmId: listTitleEduDir[2].eduId,
            dirId: listTitleEduDir[titleEduDir - 1].dirId,
            isItem:
                "${listTitleEduDir[titleEduDir - 1].dirId},${listTitleEduDir[titleEduDir - 2].dirId}",
            isMaqsadId: maqsadliId,
            langId: langId,
            emode: eModeId);
      } else if (titleEduDir == 3) {
        dataDir = await networkDir1.getDir2(
            otmId: listTitleEduDir[3].eduId,
            dirId: listTitleEduDir[titleEduDir - 1].dirId,
            isItem:
                "${listTitleEduDir[titleEduDir - 1].dirId},${listTitleEduDir[titleEduDir - 2].dirId},${listTitleEduDir[titleEduDir - 3].dirId}",
            isMaqsadId: maqsadliId,
            langId: langId,
            emode: eModeId);
      } else if (titleEduDir == 4) {
        dataDir = await networkDir1.getDir2(
            otmId: listTitleEduDir[4].eduId,
            dirId: listTitleEduDir[titleEduDir - 1].dirId,
            isItem:
                "${listTitleEduDir[titleEduDir - 1].dirId},${listTitleEduDir[titleEduDir - 2].dirId},${listTitleEduDir[titleEduDir - 3].dirId},${listTitleEduDir[titleEduDir - 4].dirId}",
            isMaqsadId: maqsadliId,
            langId: langId,
            emode: eModeId);
      }

      modelDir1 = ModelDir1.fromJson(jsonDecode(dataDir));
      listDir = modelDir1.data;
      listDirTemp.clear();
      listDirTemp.addAll(listDir);
      boolDirDownload = true;
      notifyListeners();

      log(dataDir);
    } catch (e) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: "DTM",
              desc: "Mos yo'nalish topilmadi, qayta tanlang",
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
              btnCancelOnPress: () {
                Navigator.of(context).pop();
              },
              btnCancelText: "OK")
          .show();
      log(e.toString());
    }
  }

//  Bloc #last
  NetworkSendServer networkSendServer = NetworkSendServer();
  Future setDataEduDir({required BuildContext context}) async {
    try {
      ModelSendServerInfo modelSendServerInfo = ModelSendServerInfo
        (
          sert: listCheckCertificate.isNotEmpty? mapCert:{},
          isGrand: grantContractId,
          isMaqsad: maqsadliId,
          testRegionId: testRegionId,
          langId: langId,
          testGraph: langGraphicId,
          emodeId: mapEmode,
          eduId: mapOtm,
          planId: mapDir,
          flangId: stringForeignLangId.isEmpty?"0": stringForeignLangId);
      log("send server");
      log(jsonEncode(modelSendServerInfo));
      String data = await networkSendServer.sendServerAll(allData: jsonEncode(modelSendServerInfo));
      log(data);
      ModelSms2 modelSms2 = ModelSms2.fromJson(jsonDecode(data));

      log(modelSms2.data.phone.toString());
      log(modelSms2.data.logId.toString());
      log( modelSms2.data.smsId.toString());

      pushNewScreen(context,
          screen: SmsAutoFillUi(
          phoneNum: modelSms2.data.phone.toString(),
          password: "123",
          captchaKey: modelSms2.data.logId.toString(),
          captchaValue: modelSms2.data.smsId.toString(),
          registration: "7")
      );


    } catch (e) {
      log(e.toString());
    }
  }
}
