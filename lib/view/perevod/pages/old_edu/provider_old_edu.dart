// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/perevod/internet/countrys.dart';
import 'package:mydtm/data/perevod/internet/edu_lang_perevod.dart';
import 'package:mydtm/data/perevod/internet/edu_type.dart';
import 'package:mydtm/data/perevod/internet/get_edu_direct.dart';
import 'package:mydtm/data/perevod/internet/set_data.dart';
import 'package:mydtm/data/perevod/internet/uzb_edu_perevod.dart';
import 'package:mydtm/data/perevod/model/country_model.dart';
import 'package:mydtm/data/perevod/model/edu.dart';
import 'package:mydtm/data/perevod/model/edu_lang_old.dart';
import 'package:mydtm/data/perevod/model/edu_type.dart';
import 'package:mydtm/data/perevod/model/model_mvdir.dart';
import 'package:mydtm/data/perevod/model/sent_server_result.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ProviderOldEdu extends ChangeNotifier {
  TextEditingController textEditingEducation = TextEditingController();
  TextEditingController textEditingDirection = TextEditingController();


  late String restRegionNamePerevod = "";
  late String eduTypeName = "";
  String setEduTypePerevodId = "";
  String eduLangName = "";
  String eduLangId = "";
  String restRegionNamePerevodId = "";
  String eduUzbName = "";
  String eduUzbId = "";
  String dirNames = "";
  String dirIds = "";
  String graduatedYear = "";
  String graduatedYearNames = "";
  var box = Hive.box("online");

  bool getMuassasaBool() {
    if (restRegionNamePerevodId == "860") {
      /// Uzb
      ///  eduLangName = name;
      //     eduLangId = id;
      if (eduUzbName.length > 4) {
        return true;
      } else {
        return false;
      }
    } else {
      /// Chet el
      if (eduLangName.length > 4) {
        return true;
      } else {
        return false;
      }
    }
  }

  bool getDirectionBool() {
    if (restRegionNamePerevodId == "860") {
      /// Uzb
      ///  eduLangName = name;
      //     eduLangId = id;
      if (eduUzbName.length > 4) {
        return true;
      } else {
        return false;
      }
    } else {
      /// Chet el
      if (textEditingEducation.text.trim().length > 4) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future getAllDataEdit() async {}

  /// Get Country

  bool boolForeignCountry = false;
  NetworkCountryPerevod networkCountryPerevod = NetworkCountryPerevod();
  List<DataGetCountryPerevod> listDataCountryPerevod = [];
  List<DataGetCountryPerevod> listDataCountryPerevodTemp = [];
  TextEditingController textControllerCountryPerevod = TextEditingController();

  Future getForeignCountry() async {
    try {
      boolForeignCountry = false;
      String dataNet = await networkCountryPerevod.getCountries();
      ModelGetCountryPerevod modelGetCountryPerevod =
          ModelGetCountryPerevod.fromJson(jsonDecode(dataNet));
      listDataCountryPerevod = modelGetCountryPerevod.masseage;
      listDataCountryPerevodTemp.clear();
      listDataCountryPerevodTemp.addAll(listDataCountryPerevod);
      boolForeignCountry = true;
      notifyListeners();
    } catch (e) {
      boolForeignCountry = true;
    }
  }

  Future searchCountryPerevod({required String values}) async {
    listDataCountryPerevodTemp.clear();
    notifyListeners();
    for (var val in listDataCountryPerevod) {
      if (val.name.toLowerCase().contains(values.trim().toLowerCase())) {
        listDataCountryPerevodTemp.add(val);
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future setCountryVal({required String name, required String id}) async {
    restRegionNamePerevod = name;
    restRegionNamePerevodId = id;
    eduTypeName = "";
    setEduTypePerevodId = "";
    eduLangName = "";
    eduLangId = "";
    eduUzbName = "";
    eduUzbId = "";
    dirNames = "";
    dirIds = "";
    textEditingDirection.text = "";
    textEditingEducation.text = "";
    graduatedYear = "";
    graduatedYearNames = "";
    listImagesPDF.clear();
    listFiles.clear();
    listImagesByte.clear();
    notifyListeners();
  }

  Future closeWindowPerevod({required BuildContext context}) async {
    textControllerCountryPerevod.clear();
    Navigator.of(context).pop();
  }

  /// Edu tpye

  List<DataGetEduTypeMasseage> listDataEduType = [];
  List<DataGetEduTypeMasseage> listDataEduTypeTemp = [];
  bool boolEduType = false;
  NetworkEduTypePerevod networkEduTypePerevod = NetworkEduTypePerevod();

  Future getEduTypePerevod() async {
    try {
      boolEduType = false;
      String dataNet = await networkEduTypePerevod.getEduType();
      ModelGetEduTypePerevod modelGetEduTypePerevod =
          ModelGetEduTypePerevod.fromJson(jsonDecode(dataNet));
      listDataEduType = modelGetEduTypePerevod.masseage;
      listDataEduTypeTemp.clear();
      listDataEduTypeTemp.addAll(listDataEduType);
      boolEduType = true;
      notifyListeners();
    } catch (e) {
      boolEduType = true;
    }
  }

  Future setEduTypeVal({required String name, required String id}) async {
    eduTypeName = name;
    setEduTypePerevodId = id;
    textEditingDirection.text = "";
    textEditingEducation.text = "";
    eduLangName = "";
    eduLangId = "";
    eduUzbName = "";
    eduUzbId = "";
    dirNames = "";
    dirIds = "";
    graduatedYear = "";
    graduatedYearNames = "";
    listImagesPDF.clear();
    listFiles.clear();
    listImagesByte.clear();
    notifyListeners();
  }

  /// Edu lang
  bool boolEduLang = false;
  NetworkEduLangPerevod networkEduLangPerevod = NetworkEduLangPerevod();
  List<DataLangOldPerevod> listDataLangOld = [];

  Future getEduLang() async {
    try {
      boolEduLang = false;
      String dataEduLang = await networkEduLangPerevod.getEduLangType(
          emodeID: setEduTypePerevodId);
      ModelEduLangPerevod modelEduLangPerevod =
          ModelEduLangPerevod.fromJson(jsonDecode(dataEduLang));
      listDataLangOld = modelEduLangPerevod.lang;
      boolEduLang = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  /// Edu lang
  Future setEduLangOld({required String name, required String id}) async {
    eduLangName = name;
    eduLangId = id;
    log(eduLangName);
    log(eduLangId);
    eduUzbName = "";
    eduUzbId = "";
    dirNames = "";
    dirIds = "";
    textEditingDirection.text = "";
    textEditingEducation.text = "";
    graduatedYear = "";
    graduatedYearNames = "";
    listImagesPDF.clear();
    listFiles.clear();
    listImagesByte.clear();
    notifyListeners();
  }

  /// Edu name uzb
  NetworkEduPerevod networkEduPerevod = NetworkEduPerevod();
  late ModelGetEduPerevod modelGetEduPerevod;
  List<DataGetEduPerevod> listDataGetPerevod = [];
  List<DataGetEduPerevod> listDataGetPerevodTemp = [];
  bool boolEdu = false;

  Future getUzbEdu() async {
    try {
      boolEdu = false;
      String data = await networkEduPerevod.getEdu(
          emode: setEduTypePerevodId, langId: eduLangId);
      modelGetEduPerevod = ModelGetEduPerevod.fromJson(jsonDecode(data));
      listDataGetPerevod = modelGetEduPerevod.education;
      listDataGetPerevodTemp.clear();
      listDataGetPerevodTemp.addAll(listDataGetPerevod);
      boolEdu = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future searchEduName({required String nameEdu}) async {
    try {
      boolEdu = false;
      notifyListeners();
      listDataGetPerevodTemp.clear();
      for (var valeus in listDataGetPerevod) {
        if (valeus.name
            .trim()
            .toLowerCase()
            .contains(nameEdu.trim().toLowerCase())) {
          listDataGetPerevodTemp.add(valeus);
        }
      }
      boolEdu = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future setEduName({required String name, required String eduId}) async {
    eduUzbName = name;
    eduUzbId = eduId;
    dirNames = "";
    dirIds = "";
    graduatedYear = "";
    graduatedYearNames = "";
    listImagesPDF.clear();
    listFiles.clear();
    listImagesByte.clear();
    getDirectionBool();
    notifyListeners();
  }

  /// Edu Direction
  bool boolEduDirection = false;
  NetworkUzbEduDirPerevod networkUzbEduDirPerevod = NetworkUzbEduDirPerevod();
  List<DataMvdirPerevod> listDataMVDir = [];
  List<DataMvdirPerevod> listDataMVDirTemp = [];

  Future getEduDir() async {
    try {
      boolEduDirection = false;
      String data = await networkUzbEduDirPerevod.getUzbEduDir(
          emod: setEduTypePerevodId, langId: eduLangId, eduId: eduUzbId);
      ModelEduMvDirPerevod modelEduMvDirPerevod =
          ModelEduMvDirPerevod.fromJson(jsonDecode(data));
      listDataMVDir = modelEduMvDirPerevod.mvdir;
      listDataMVDirTemp.clear();
      listDataMVDirTemp.addAll(listDataMVDir);
      boolEduDirection = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future searchEduDir({required String dirName}) async {
    try {
      boolEduDirection = false;
      notifyListeners();
      listDataMVDirTemp.clear();
      for (var valeus in listDataMVDir) {
        if (valeus.name
            .trim()
            .toLowerCase()
            .contains(dirName.trim().toLowerCase())) {
          listDataMVDirTemp.add(valeus);
        }
      }
      boolEduDirection = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future setEduDirection(
      {required String dirName, required String dirId}) async {
    try {
      dirNames = dirName;
      dirIds = dirId;
      graduatedYear = "";
      graduatedYearNames = "";
      listImagesPDF.clear();
      listFiles.clear();
      listImagesByte.clear();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  /// Graduated Year
  Future setGraduatedYears(
      {required String year, required String graduatedYearName}) async {
    graduatedYear = year;
    graduatedYearNames = graduatedYearName;
    listImagesPDF.clear();
    listFiles.clear();
    listImagesByte.clear();
    notifyListeners();
  }

  ///
  ///
  /// / image
  List<Image> listImagesPDF = [];
  List<String> listImagesByte = [];
  List<File> listFiles = [];

  num mbSizeZero = 0;

  Future getImageForPdf({required Image image}) async {
    listImagesPDF.add(image);
    notifyListeners();
  }

  Future getImageString({required String imageString}) async {
    listImagesByte.add(imageString);
    notifyListeners();
  }

  Future getImageFile({required File file}) async {

    listFiles.add(file);
    notifyListeners();
  }

  bool boolConvertImageToPdf = false;
  File? fileToServerPerevod;

  Future<pw.PageTheme> pageThemes(PdfPageFormat format) async {

    final materialIcons = await rootBundle.load("assets/fonts/Roboto-Medium.ttf");

    final materialIconsTtf = pw.Font.ttf(materialIcons);
    return pw.PageTheme(
      pageFormat: format,
      theme: pw.ThemeData.withFont(
        icons: materialIconsTtf,
      ),
    );
  }

  Future<File> createPdfFile({required BuildContext contexts}) async {
    final materialIcons = await rootBundle.load("assets/fonts/Roboto-Medium.ttf");
    boolConvertImageToPdf = false;
    var pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        // maxPages: 3,
        // pageFormat: PdfPageFormat.a4,
        pageTheme:await pageThemes(PdfPageFormat.a4),
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        mainAxisAlignment: pw.MainAxisAlignment.center,
        header: (pw.Context context) {
          if (context.pageNumber == 1) {
            return pw.SizedBox(
              width: 220,
              child: pw.Text(box.get("fio").toString(),
              style: pw.TextStyle(
                font: pw.Font.ttf(materialIcons),
              //   fontSize: 25,
              )),
            );
          }else{
            return   pw.SizedBox(
              width: 220,
              child: pw.Text(box.get("fio").toString(),
                  style: pw.TextStyle(
                    font: pw.Font.ttf(materialIcons),
                    //   fontSize: 25,
                  )),

              // style: pw.TextStyle(
              //   font: pw.Font.ttf(materialIcons),
              //   fontSize: 25,
              // ),
            );
          }
        },
        build: (context) => [

          pw.SizedBox(
              height: 700,
              width: MediaQuery.of(contexts).size.width,
              child: pw.Stack(children: [
                pw.Image(

                  pw.MemoryImage(

                    base64Decode(
                      listImagesByte[0],
                    ),
                  ),
                  fit: pw.BoxFit.cover,
                ),
              ])),
          listImagesByte.length >= 2
              ? pw.SizedBox(
                  height: 700,
                  width: MediaQuery.of(contexts).size.width,
                  child: pw.Image(
                    pw.MemoryImage(
                      base64Decode(
                        listImagesByte[1],
                      ),
                    ),
                    fit: pw.BoxFit.fill,
                  ),
                )
              : pw.SizedBox.shrink(),
          listImagesByte.length >= 3
              ? pw.SizedBox(
                  height: 700,
                  width: MediaQuery.of(contexts).size.width,
                  child: pw.Image(
                    pw.MemoryImage(
                      base64Decode(
                        listImagesByte[2],
                      ),
                    ),
                    fit: pw.BoxFit.fill,
                  ),
                )
              : pw.SizedBox.shrink(),
        ],
      ),
    );
    boolConvertImageToPdf = true;

    notifyListeners();

    return saveDocument(name: "bmba.pdf", pdf: pdf);

  }

  Future openFiles(File file) async {
    final url = file.path;
    // log(file.path);
    await OpenFile.open(url);
  }

  Future<File> saveDocument(
      {required String name, required pw.Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$name");
    await file.writeAsBytes(bytes);

    fileToServerPerevod = file;
    notifyListeners();
    return file;
  }

  Future deleteItemList({required int index}) async {
    listImagesPDF.removeAt(index);
    listImagesByte.removeAt(index);
    listFiles.removeAt(index);
    notifyListeners();
  }

  ///

  NetworkSetOldEduPerevod networkSetOldEduPerevod = NetworkSetOldEduPerevod();
  bool boolUploadIndicatorServer = true;

  late MessageSendServerPerevod messageSendServerPerevod;

  Future sentServerData({required BuildContext context}) async {
    if (listFiles.isNotEmpty) {
      try {
        final bytes = (await fileToServerPerevod!.readAsBytes()).lengthInBytes;
        final kb = bytes / 1024;
        final mb = kb / 1024;
        if (mb > 8) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.noHeader,
                  animType: AnimType.bottomSlide,
                  dismissOnTouchOutside: false,
                  title: "BBA",
                  desc: "imageMaxSize".tr(),
                  titleTextStyle: TextStyle(
                      color: MyColors.appColorBlue1(),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  descTextStyle: TextStyle(
                      color: MyColors.appColorBlack(),
                      fontWeight: FontWeight.bold),
                  btnCancelOnPress: () {},
                  btnCancelText: "OK")
              .show();
        } else {
          if (
          restRegionNamePerevodId == "860"&&
          restRegionNamePerevod.length > 4 &&
              eduTypeName.length > 4 &&
              eduLangName.length > 4 &&
              eduUzbName.length > 4 &&
              textEditingDirection.text.trim().length > 4 &&
              graduatedYearNames.length > 4 &&
              mb < 8
            &&  listFiles.isNotEmpty
          ) {
            String networkData = "";
            boolUploadIndicatorServer = false;
            notifyListeners();
            FormData formData = FormData.fromMap({
              "region_id": restRegionNamePerevodId,
              "emode_id": setEduTypePerevodId,
              "syear": graduatedYear,
              "edu_name": eduUzbName,
              "mvdir_name": textEditingDirection.text.trim(),
              "image": await MultipartFile.fromFile(fileToServerPerevod!.path,
                  filename: "mobil_${box.get("token")}.pdf")
            });
            try {
              networkData = await networkSetOldEduPerevod.setServerOldEdu(
                  formDate: formData);
              ModelDataSendServerPerevod modelDataSendServerPerevod =
                  ModelDataSendServerPerevod.fromJson(jsonDecode(networkData));
              messageSendServerPerevod = modelDataSendServerPerevod.masseage;
              boolUploadIndicatorServer = true;
              AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                animType: AnimType.bottomSlide,
                dismissOnTouchOutside: false,
                body: Column(
                  children: [
                    Text("saved".tr(),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: MyColors.appColorBlue1())),
                    const Divider(),
                    const SizedBox(height: 20),
                    Text("continue".tr(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                titleTextStyle: TextStyle(
                    color: MyColors.appColorBlue1(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                descTextStyle: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.bold),
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
                btnOkColor: MyColors.appColorBlue1(),
                btnCancelColor: MyColors.appColorGrey400(),
                btnOkText: "yes".tr(),
                btnCancelText: "no".tr(),
              ).show();
              notifyListeners();
            } catch (e) {
              log("#888");
              log(e.toString());
            }
          } else if (
          restRegionNamePerevodId != "860"&&
              restRegionNamePerevod.length > 4 &&
              eduTypeName.length > 4 &&
              eduLangName.length > 4 &&
              textEditingEducation.text.trim().length > 4 &&
              textEditingDirection.text.trim().length > 4 &&
              graduatedYearNames.length > 4 &&
              mb < 8
              &&  listFiles.isNotEmpty
          ) {

            String networkData = "";
            boolUploadIndicatorServer = false;
            notifyListeners();
            FormData formData = FormData.fromMap({
              "region_id": restRegionNamePerevodId,
              "emode_id": setEduTypePerevodId,
              "syear": graduatedYear,
              "edu_name": textEditingEducation.text.trim(),
              "mvdir_name": textEditingDirection.text.trim(),
              "image": await MultipartFile.fromFile(fileToServerPerevod!.path,
                  filename: "mobil_${box.get("token")}.pdf")
            });
            try {
              networkData = await networkSetOldEduPerevod.setServerOldEdu(
                  formDate: formData);
              ModelDataSendServerPerevod modelDataSendServerPerevod =
              ModelDataSendServerPerevod.fromJson(jsonDecode(networkData));
              messageSendServerPerevod = modelDataSendServerPerevod.masseage;
              boolUploadIndicatorServer = true;
              AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                animType: AnimType.bottomSlide,
                dismissOnTouchOutside: false,
                body: Column(
                  children: [
                    Text("saved".tr(),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: MyColors.appColorBlue1())),
                    const Divider(),
                    const SizedBox(height: 20),
                    Text("continue".tr(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                titleTextStyle: TextStyle(
                    color: MyColors.appColorBlue1(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                descTextStyle: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.bold),
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
                btnOkColor: MyColors.appColorBlue1(),
                btnCancelColor: MyColors.appColorGrey400(),
                btnOkText: "yes".tr(),
                btnCancelText: "no".tr(),
              ).show();
              notifyListeners();
            } catch (e) {
              log("#888");
              log(e.toString());
            }
            ///

            AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.bottomSlide,
                    dismissOnTouchOutside: false,
                    title: "BBA",
                    desc: "infoFillError".tr(),
                    titleTextStyle: TextStyle(
                        color: MyColors.appColorBlue1(),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    descTextStyle: TextStyle(
                        color: MyColors.appColorBlack(),
                        fontWeight: FontWeight.bold),
                    btnCancelOnPress: () {},
                    btnCancelText: "OK")
                .show();
          }
        }
      } catch (e) {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                animType: AnimType.bottomSlide,
                dismissOnTouchOutside: false,
                title: "BBA",
                desc: "infoFillError".tr(),
                titleTextStyle: TextStyle(
                    color: MyColors.appColorBlue1(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                descTextStyle: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.bold),
                btnCancelOnPress: () {},
                btnCancelText: "OK")
            .show();
      }
    } else {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,
              animType: AnimType.bottomSlide,
              dismissOnTouchOutside: false,
              title: "BBA",
              desc: "pictureNotInfo".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
              btnCancelOnPress: () {},
              btnCancelText: "OK")
          .show();
    }
  }
}
