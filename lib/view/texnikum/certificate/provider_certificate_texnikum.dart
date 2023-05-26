// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/person_info/certificate/foreign_cert.dart';
import 'package:mydtm/data/model_parse/person_info/certificate/foreign_cert.dart';
import 'package:mydtm/data/texnikum/internet/certificate_texnikum/c0_get_flang_cert.dart';
import 'package:mydtm/data/texnikum/internet/certificate_texnikum/c1_get_foreign_cert.dart';
import 'package:mydtm/data/texnikum/internet/certificate_texnikum/c2_get_foreign_lang_type.dart';
import 'package:mydtm/data/texnikum/internet/certificate_texnikum/c3_cert_degree.dart';
import 'package:mydtm/data/texnikum/internet/certificate_texnikum/c4_sent_server.dart';
import 'package:mydtm/data/texnikum/models/model_certificate/m0_model_flang_cert.dart';
import 'package:mydtm/data/texnikum/models/model_certificate/m1_model_foregian_lang.dart';
import 'package:mydtm/data/texnikum/models/model_certificate/m2_lang_type.dart';
import 'package:mydtm/data/texnikum/models/model_certificate/m3_model_flang_degre.dart';
import 'package:mydtm/data/texnikum/models/model_certificate/m4_after_save.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/model_botton_sheet.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ProviderCertificateTexnikum extends ChangeNotifier {
  bool imageChange = true;
  var box = Hive.box("online");

  //
  NetworkGetFlangTexnikum networkNationalCert = NetworkGetFlangTexnikum();
  late ModeFLangTexnikum modeFLangTexnikum;

  bool boolCheckCertificateData = false;
  bool boolCheckCertificateDataNot = false;

  Future getNationCertInfo() async {
    try {
      boolCheckCertificateData = false;
      String dataCert = await networkNationalCert.getUserInfoTexnikum();
      modeFLangTexnikum  =
          ModeFLangTexnikum.fromJson(jsonDecode(dataCert));

      boolCheckCertificateData = true;
      notifyListeners();
    } catch (e) {
      boolCheckCertificateData = true;
      boolCheckCertificateDataNot = true;
      notifyListeners();
    }
  }

  // lang cert
  NetworkForeignCert networkForeignCert = NetworkForeignCert();
  late ModelCheckForeignCertificate modelCheckForeignCertificate;
  DataCheckForeignCertificate dataCheckForeignCertificate =
  DataCheckForeignCertificate();

  bool boolCheckForeignLang = false;
  bool boolCheckForeignLangNot = false;

  Future getForeignCertTexnikum() async {
    try {
      boolCheckForeignLang = false;
      String dataCertForeign = await networkForeignCert.getForeignCert();
      modelCheckForeignCertificate =
          ModelCheckForeignCertificate.fromJson(jsonDecode(dataCertForeign));
      dataCheckForeignCertificate = modelCheckForeignCertificate.data;
      boolCheckForeignLang = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      boolCheckForeignLangNot = true;
      boolCheckForeignLang = true;

      notifyListeners();
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  late File files;
  Future changeImage(
      {required dynamic imageData, required String fileTypeName, required var file}) async {
    imageChange = false;
    box.delete("image");
    box.delete("imageServer");
    files = file;
    notifyListeners();
    box.put("image", imageData!.replaceAll("\n", ""));
    box.put("imageServer",
        "data:image/$imageData;base64, ${imageData!.replaceAll("\n", "")}");
    await Future.delayed(const Duration(milliseconds: 400)).then((value) {
      imageChange = true;
    });
    notifyListeners();
  }

  /// Foreign Lang
  bool imageChange2 = true;

  addImageForeign(
      {required BuildContext context,
        required ProviderCertificateTexnikum providerCertificateTexnikum,
        required Function fff}) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enableDrag: true,
      builder: (context) => Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              )),
          height: 200,
          child: ChooseImageForeignLangTexnikum(
              providerCertificateTexnikum: providerCertificateTexnikum, f: fff)),
    );
  }

  bool boolForeignImage = false;
  File? fileToServer;
  String? fileName;
  Future changeImageForeign(
      {required dynamic imageData,
        required String fileTypeName,
        required File imageFile,
        required Function fff}) async {
    try {
      imageChange2 = false;
      boolForeignImage = false;
      fileToServer = imageFile;
      fileName = fileTypeName;
      box.delete("image");
      box.delete("imageServer");
      box.delete("imageServer");
      box.put("image", imageData!.replaceAll("\n", ""));
      box.put("imageServer",
          "data:image/$fileTypeName;base64, ${imageData!.replaceAll("\n", "")}");
      await Future.delayed(const Duration(milliseconds: 400)).then((value) {
        imageChange2 = true;
      });
      boolForeignImage = true;
      fff();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  ///
  NetworkGetForeignLangTexnikum networkGetLanguages =
      NetworkGetForeignLangTexnikum();
  TextEditingController textEditingLangSearchTexnikum = TextEditingController();
  List<DataForeignLangTexnikum> listDataForeignLang = [];
  List<DataForeignLangTexnikum> listDataForeignLangTemp = [];
  bool boolCerGetLang = false;

  Future getLanguage({required BuildContext context}) async {
    try {
      boolCerGetLang = false;
      String data = await networkGetLanguages.getUserInfoTexnikum();
      log(data);
      ModelForeignLangTexnikum modelGetForeignLang =
          ModelForeignLangTexnikum.fromJson(jsonDecode(data));
      listDataForeignLang = modelGetForeignLang.data;
      listDataForeignLangTemp = listDataForeignLang;
      boolCerGetLang = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future searchCertLang({required String value}) async {
    listDataForeignLangTemp.clear();
    for (var val in listDataForeignLang) {
      if (val.name.trim().toLowerCase().contains(value.trim().toLowerCase())) {
        listDataForeignLangTemp.add(val);
      }
    }
    notifyListeners();
  }

  Future clearTextCerLang() async {
    boolCerGetLang = false;
    notifyListeners();
    listDataForeignLangTemp.clear();
    textEditingLangSearchTexnikum.clear();
    listDataForeignLangTemp.addAll(listDataForeignLang);
    boolCerGetLang = true;
    notifyListeners();
  }

  String certLangName = '';
  String certLangId = '';

  // langTypeIds = "";
  // langTypeNames = "";
  // langLevelIds = "";
  // langNameLevel = "";
  // dateYearMonthDay
  // textForeignSertNumber.text

  Future setCertLang({required String distId, required String distName}) async {
    certLangName = distName;
    certLangId = distId;

    langTypeIds = "";
    langTypeNames = "";
    langLevelIds = "";
    langNameLevel = "";
    dateYearMonthDayTexnikum = "";
    textForeignSertNumberTexnikum.text = "";
    notifyListeners();
  }

  /// Cert type
  List<DataLangTypeTexnikum> listLangType = [];
  List<DataLangTypeTexnikum> listLangTypeTemp = [];
  bool boolCertType = false;
  NetworkGetForeignLangTypeTexnikum networkGetLangType =
      NetworkGetForeignLangTypeTexnikum();

  Future getLanguageCertType({required BuildContext context}) async {
    try {
      boolCertType = false;
      String data =
          await networkGetLangType.getLangTypeTexnikum(fLangId: certLangId);

      ModelForeignLangTypeTexnikum modelGetLangType =
          ModelForeignLangTypeTexnikum.fromJson(jsonDecode(data));
      listLangType = modelGetLangType.data;
      listLangTypeTemp = listLangType;
      boolCertType = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  String langTypeIds = "";
  String langTypeNames = "";

  Future setLangType(
      {required String langTypeId, required String langTypeName}) async {
    langTypeIds = langTypeId;
    langTypeNames = langTypeName;
    langLevelIds = "";
    langNameLevel = "";
    dateYearMonthDayTexnikum = "";
    textForeignSertNumberTexnikum.text = "";
    notifyListeners();
  }

  /// Cert level
  List<DataForeignLangDegreeTexnikum> listLangLevel = [];
  List<DataForeignLangDegreeTexnikum> listLangLevelTemp = [];
  bool boolCertLevel = false;
  NetworkGetForeignLangDegreeTexnikum networkGetLangLevel =
      NetworkGetForeignLangDegreeTexnikum();

  Future getLanguageCertLevel({required BuildContext context}) async {
    try {
      boolCertLevel = false;
      String data =
          await networkGetLangLevel.getLangDegreeTexnikum(fLangId: langTypeIds);
      log(data);
      ModelForeignLangDegreeTexnikum modelGetLangLevel =
          ModelForeignLangDegreeTexnikum.fromJson(jsonDecode(data));
      listLangLevel = modelGetLangLevel.data;
      log(jsonEncode(listLangLevel));
      listLangLevelTemp = listLangLevel;
      boolCertLevel = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  String langLevelIds = "";
  String langNameLevel = "";

  Future setLangLevel(
      {required String langLevelId, required String langLeveName}) async {
    langLevelIds = langLevelId;
    langNameLevel = langLeveName;
    dateYearMonthDayTexnikum = "";
    textForeignSertNumberTexnikum.text = "";
    notifyListeners();
  }

  ///
  DateTime currentDateTexnikum = DateTime.now();
  String dateYearMonthDayTexnikum = "";

  Future<void> selectDate(
      {required BuildContext context, required Function fff}) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDateTexnikum,
        firstDate: DateTime(2019),
        lastDate: currentDateTexnikum);
    if (pickedDate != null && pickedDate != currentDateTexnikum) {
      currentDateTexnikum = pickedDate;
      // log(DateFormat(currentDate)).YEAR_MONTH_DAY
      log(DateFormat('yyyy-MM-dd').format(currentDateTexnikum));

      dateYearMonthDayTexnikum =
          DateFormat('yyyy-MM-dd').format(currentDateTexnikum);

      fff();
      notifyListeners();
    }
  }

  TextEditingController textForeignSertNumberTexnikum = TextEditingController();

  ///
  NetworkSentServerCertTexnikum networkSentServerCert = NetworkSentServerCertTexnikum();
  bool boolSentServerCertificate = false;
  late Masseage setServerCertificate;

  Future sentCertificateServer(
      {required BuildContext context,
      required Function stateFunc,
      required Function stateFunc2}) async {
    try {
      // log( textForeignSertNumber.text);
      // log( langTypeIds);
      // log( dateYearMonthDay);
      // log("dtm_${textForeignSertNumber.text}.$fileName");
      boolSentServerCertificate = true;

      String networkData ="";
      FormData formData =  FormData.fromMap({
        "ser_num": textForeignSertNumberTexnikum.text,
        "flang_level_id": langLevelIds,
        "given_date": dateYearMonthDayTexnikum,
        "image": await MultipartFile.fromFile(fileToServer!.path,
            filename: "dtm_${textForeignSertNumberTexnikum.text}.$fileName")
      });
      try{
        networkData  =
        await networkSentServerCert.getNationalCertTexnikum(formDate: formData);
        log("networkData");
        log(networkData);
      }catch(e){
        log(e.toString());
      }
      ModelSaveCertificateTexnikum modelSetServerCertificate = ModelSaveCertificateTexnikum.fromJson(jsonDecode(networkData));
      setServerCertificate = modelSetServerCertificate.masseage;
      boolSentServerCertificate = false;
      stateFunc();
      await stateFunc2();
      notifyListeners();
      AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.bottomSlide,
          title: "BMBA",
          desc: "infoAccessWait".tr(),
          titleTextStyle: TextStyle(
              color: MyColors.appColorBlue1(), fontSize: 24, fontWeight: FontWeight.bold),
          descTextStyle: TextStyle(
              color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
          btnCancelOnPress: () async{
            await stateFunc2();
            Navigator.of(context).pop();
            // Navigator.of(context).pop();
            // Navigator.of(context).pop();
          },
          btnCancelColor: MyColors.appColorBlue1(),
          btnCancelText: "OK")
          .show();

    }catch(e){
      boolSentServerCertificate = false;
      log("e.toString()");
      log(e.toString());
    }
  }
}
