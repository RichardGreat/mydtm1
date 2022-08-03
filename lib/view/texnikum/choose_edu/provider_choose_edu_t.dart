import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/texnikum/internet/edu_choose/t1_emode_texnik.dart';
import 'package:mydtm/data/texnikum/internet/edu_choose/t2_lang_edu_texnikum.dart';
import 'package:mydtm/data/texnikum/internet/edu_choose/t3_edu_texnikum.dart';
import 'package:mydtm/data/texnikum/internet/edu_choose/t4_edu_dir_texnikum.dart';
import 'package:mydtm/data/texnikum/internet/edu_choose/t5_lang_foreign.dart';
import 'package:mydtm/data/texnikum/internet/edu_choose/t6_set_all_tex.dart';
import 'package:mydtm/data/texnikum/models/edu_tex/t1_emod_tex.dart';
import 'package:mydtm/data/texnikum/models/edu_tex/t2_model_lang.dart';
import 'package:mydtm/data/texnikum/models/edu_tex/t3_model_eduacation.dart';
import 'package:mydtm/data/texnikum/models/edu_tex/t4_model_direction_etx.dart';
import 'package:mydtm/data/texnikum/models/edu_tex/t5_model_lang_foreign.dart';
import 'package:mydtm/data/texnikum/models/edu_tex/t6_get_all.dart';

class ProviderChooseEduTexnikum extends ChangeNotifier {
  bool boolEduTypeTexnikum = false;
  NetworkEmodeEDuTexnikum networkEmodeEDuTexnikum = NetworkEmodeEDuTexnikum();
  late ModelEModeEduTexnikum modeEduTexnikum;

  Future getEduType() async {
    boolEduTypeTexnikum = false;
    String data = await networkEmodeEDuTexnikum.getEmodeTexnikum();
    log(data);
    log("777");

    modeEduTexnikum = ModelEModeEduTexnikum.fromJson(jsonDecode(data));

    boolEduTypeTexnikum = true;
    notifyListeners();
  }

  String idEduType = "";
  String nameEduType = "";

  Future setEduTypeTexnikum(
      {required String idType, required String nameType}) async {
    idEduType = idType;
    nameEduType = nameType;
    notifyListeners();
  }

  bool boolEduLangTexnikum = false;
  NetworkLangEduTexnikum networkLangEduTexnikum = NetworkLangEduTexnikum();
  late ModelLangEduTexnikum modelLangEduTexnikum;

  Future getLangEduTexnikum({required BuildContext context}) async {
    try {
      boolEduLangTexnikum = false;
      String data =
          await networkLangEduTexnikum.getLangTexnikum(emodId: idEduType);
      modelLangEduTexnikum = ModelLangEduTexnikum.fromJson(jsonDecode(data));
      boolEduLangTexnikum = true;
      notifyListeners();
    } catch (e) {}
  }

  String idEduLangTex = "";
  String nameEduLangTex = "";

  Future setLangEduTexnikum(
      {required String idEduLang, required String nameEduLang}) async {
    idEduLangTex = idEduLang;
    nameEduLangTex = nameEduLang;
    notifyListeners();
  }

  bool boolEducationChoose = false;
  NetworkEDuTexnikum networkEDuTexnikum = NetworkEDuTexnikum();
  late ModelEducationTexnikum modelEducationTexnikum;
  List<DataEducationTexnikum> listEducationTex = [];
  List<DataEducationTexnikum> listEducationTexTemp = [];
  TextEditingController textEditingController = TextEditingController();

  Future getEducationTexnikum() async {
    try {
      boolEducationChoose = false;
      String data = await networkEDuTexnikum.getEduTexnikum(
          eModeId: idEduType, langId: idEduLangTex);
      modelEducationTexnikum =
          ModelEducationTexnikum.fromJson(jsonDecode(data));
      listEducationTex.clear();
      listEducationTex = modelEducationTexnikum.education;
      listEducationTexTemp.clear();
      listEducationTexTemp.addAll(listEducationTex);
      boolEducationChoose = true;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future searchEducationTex({required String eduSearchValue}) async {
    listEducationTexTemp.clear();
    for (var val in listEducationTex) {
      if (val.name
          .toString()
          .trim()
          .toLowerCase()
          .contains(eduSearchValue.trim().toLowerCase())) {
        listEducationTexTemp.add(val);
      }
    }
    notifyListeners();
  }

  String eduNameTexnikum = "";
  String idEduTexnikum = "";

  Future setEducationInfoTexnikum(
      {required String nameEduTex, required String idEduTex}) async {
    eduNameTexnikum = nameEduTex;
    idEduTexnikum = idEduTex;
    notifyListeners();
  }

  ///
  bool boolEduDirectionTex = false;
  NetworkEDuDirTexnikum networkEDuDirTexnikum = NetworkEDuDirTexnikum();
  late ModelEducationDirTexnikum modelEducationDirTexnikum;
  List<DataMvdirTexnikum> listMvDirTex = [];
  List<DataMvdirTexnikum> listMvDirTexTemp = [];
  TextEditingController textEduDirectionController = TextEditingController();

  Future getEduDirTexnikum() async {
    try {
      boolEduDirectionTex = false;
      String data = await networkEDuDirTexnikum.getEduDirTexnikum(
          eModeId: idEduType, langId: idEduLangTex, eduId: idEduTexnikum);
      modelEducationDirTexnikum =
          ModelEducationDirTexnikum.fromJson(jsonDecode(data));
      listMvDirTex.clear();
      listMvDirTex = modelEducationDirTexnikum.mvdir;
      listMvDirTexTemp.clear();
      listMvDirTexTemp.addAll(listMvDirTex);
      boolEduDirectionTex = true;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  String directionNameTexnikum = "";
  String idDirectionTexnikum = "";

  Future setDirectionInfoTexnikum(
      {required String nameDirectionTex,
      required String idDirectionTex}) async {
    directionNameTexnikum = nameDirectionTex;
    idDirectionTexnikum = idDirectionTex;
    notifyListeners();
  }

  Future searchDirectionTex({required String val}) async {
    listMvDirTexTemp.clear();
    for (var value in listMvDirTex) {
      if (value.name.trim().toLowerCase().contains(val.trim().toLowerCase())) {
        listMvDirTexTemp.add(value);
      }
    }
    notifyListeners();
  }

  bool boolLangForeignTex = false;
  NetworkLangForeignTexnikum networkLangForeignTexnikum =
      NetworkLangForeignTexnikum();
  late ModelLangForeignTexnikum modelLangForeignTexnikum;

  Future getLangForeignTex() async {
    try {
      boolLangForeignTex = false;
      String data = await networkLangForeignTexnikum.getLangForeignTexnikum();
      modelLangForeignTexnikum =
          ModelLangForeignTexnikum.fromJson(jsonDecode(data));
      boolLangForeignTex = true;
      notifyListeners();
    } catch (e) {}
  }

  String foreignLangIds = "";
  String foreignLangNames = "";

  Future setLangForeignTexnikum(
      {required String foreignLangId, required String foreignLangName}) async {
    foreignLangIds = foreignLangId;
    foreignLangNames = foreignLangName;
    notifyListeners();
  }

  NetworkSetAllTexnikum networkSetAllTexnikum = NetworkSetAllTexnikum();
  bool boolSetAllData = true;
  late ModelGetAllTexnikum modelGetAllTexnikum;

  Future setAllData() async {
    Map<String, String> mapAll = {
      "emode_id": idEduType,
      "lang_id": idEduLangTex,
      "edu_id": idEduTexnikum,
      "direction_id": idDirectionTexnikum,
      "flang": foreignLangIds
    };

    try {
      boolSetAllData = false;
      notifyListeners();
      String data = await networkSetAllTexnikum.setAllTexnikum(mapData: mapAll);
      modelGetAllTexnikum = ModelGetAllTexnikum.fromJson(jsonDecode(data));

      log(data);
      boolSetAllData = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
