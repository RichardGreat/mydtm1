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
      modeEduTexnikum = ModelEModeEduTexnikum.fromJson(jsonDecode(data));
      notifyListeners();
      } catch (e) {
        log(e.toString());
      }
      boolEduLangTexnikum = true;
      notifyListeners();

  }
}
