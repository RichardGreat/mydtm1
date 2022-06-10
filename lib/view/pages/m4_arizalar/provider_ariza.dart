import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/ariza_check.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/downloads_url.dart';
import 'package:mydtm/data/model_parse/m4_qayd_var/downloads.dart';
import 'package:mydtm/data/model_parse/m4_qayd_var/model_qayd_varaqa.dart';

class ProviderAriza extends ChangeNotifier {
  NetworkArizaCheck networkArizaCheck = NetworkArizaCheck();
  late Model model;
  late Person person;
  bool boolQaydVaraqaDownload = false;

  Future getQaydVaraqa() async {
    try {
      boolQaydVaraqaDownload = false;
      String dataAriza = await networkArizaCheck.getCheckAriza();
      ModelArizaQadVaraqa modelArizaQadVaraqa =
          ModelArizaQadVaraqa.fromJson(jsonDecode(dataAriza));
      DataArizaQadVaraqa dataArizaQadVaraqa = modelArizaQadVaraqa.data;
      model = dataArizaQadVaraqa.model;
      person = dataArizaQadVaraqa.person;
      boolQaydVaraqaDownload = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  NetworkDownloads networkDownloads = NetworkDownloads();

  Future getDownloads({required int categoryId}) async {
    /// String url o'zgartirish kerak
    if (categoryId == 1) {
      String dataDownloads = await networkDownloads.getCheckDownloads();
      ModelGetDownloads modelGetDownloads = ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
      log(modelGetDownloads.data.src);
    } else if (categoryId == 2) {
      String dataDownloads = await networkDownloads.getCheckDownloads();
      ModelGetDownloads modelGetDownloads = ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
      log(modelGetDownloads.data.src);
    } else if (categoryId == 3) {
      String dataDownloads = await networkDownloads.getCheckDownloads();
      ModelGetDownloads modelGetDownloads = ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
      log(modelGetDownloads.data.src);

    }
  }
}
