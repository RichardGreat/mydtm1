import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mydtm/data/texnikum/internet/edu_choose/emode_texnik.dart';
import 'package:mydtm/data/texnikum/models/edu_tex/emod_tex.dart';

class ProviderChooseEduTexnikum extends ChangeNotifier {
  bool boolEduLangTexnikum = true;

  bool boolEduTypeTexnikum = false;
  NetworkEmodeEDuTexnikum networkEmodeEDuTexnikum = NetworkEmodeEDuTexnikum();
  late ModelEModeEduTexnikum modeEduTexnikum;

  Future getEduType() async {

      boolEduLangTexnikum = false;
      String data = await networkEmodeEDuTexnikum.getEmodeTexnikum();
      log(data);
      log("777");
      try {
        log("888");
      modeEduTexnikum = ModelEModeEduTexnikum.fromJson(jsonDecode(data));
        log("111");
      } catch (e) {
        log("999");
        print(e.toString());
        log(e.toString());
      }
      boolEduLangTexnikum = true;
      notifyListeners();

  }
}
