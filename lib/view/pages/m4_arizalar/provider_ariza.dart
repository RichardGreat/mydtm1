import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/answersheet.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/ariza_check.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/qayd_varaqa.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/ruxsanoma.dart';
import 'package:mydtm/data/model_parse/m4_qayd_var/downloads.dart';
import 'package:mydtm/data/model_parse/m4_qayd_var/model_qayd_varaqa.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ProviderAriza extends ChangeNotifier {
  NetworkArizaCheck networkArizaCheck = NetworkArizaCheck();
  late Model model;
  late Person person;
  bool boolQaydVaraqaDownload = false;
  bool boolQaydVaraqaDownloadNot = false;
  bool boolBitiruvchi = false;
  Future getQaydVaraqa() async {
    try {
      boolQaydVaraqaDownload = false;
      String dataAriza = await networkArizaCheck.getCheckAriza();
      ModelArizaQadVaraqa modelArizaQadVaraqa =
          ModelArizaQadVaraqa.fromJson(jsonDecode(dataAriza));
      log(dataAriza);
      DataArizaQadVaraqa dataArizaQadVaraqa = modelArizaQadVaraqa.data;
      model = dataArizaQadVaraqa.model;
      if(model.invoice == null){
        boolBitiruvchi = true;
        notifyListeners();
      }
      person = dataArizaQadVaraqa.person;
      boolQaydVaraqaDownload = true;
      notifyListeners();
    } catch (e) {
      boolQaydVaraqaDownloadNot = true;
      boolQaydVaraqaDownload = true;
      notifyListeners();
      log(e.toString());
    }
  }

  NetworkDownloadsQaydVaraqa networkDownloadsQaydVaraqa = NetworkDownloadsQaydVaraqa();
  NetworkDownloadsRuxsatnoma networkDownloadsRuxsatnoma = NetworkDownloadsRuxsatnoma();
  NetworkDownloadsAnswerSheet networkDownloadsAnswerSheet = NetworkDownloadsAnswerSheet();
  late ModelGetDownloads modelGetDownloadsData1;
  late ModelGetDownloads modelGetDownloadsData2;
  late ModelGetDownloads modelGetDownloadsData3;

  late DataGetDownloads modelGetDownloads1;
  late DataGetDownloads modelGetDownloads2;
  late DataGetDownloads modelGetDownloads3;
  bool boolDataDownload1 = false;
  bool boolDataDownload2 = false;
  bool boolDataDownload3 = false;


  Future getDownloads({required int categoryId}) async {

    /// String url o'zgartirish kerak
    if (categoryId == 1) {
     try {
        boolDataDownload1 = false;
        String dataDownloads = await networkDownloadsQaydVaraqa.getCheckDownloads();
        modelGetDownloadsData1 =
            ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
        modelGetDownloads1 = modelGetDownloadsData1.data;
        boolDataDownload1 = true;
        notifyListeners();
        log(modelGetDownloadsData1.data.src);
      }catch(e){
       modelGetDownloadsData1.status = 0;
       log(e.toString());}
    } else if (categoryId == 2) {
      try{
        boolDataDownload2 = false;
        String dataDownloads = await networkDownloadsRuxsatnoma.getCheckDownloads();
        modelGetDownloadsData2 = ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
        modelGetDownloads2 = modelGetDownloadsData2.data;
        boolDataDownload2 = true;
        notifyListeners();
      }catch(e){
        modelGetDownloadsData2.status = 0;
      }

    } else if (categoryId == 3) {
    try{
      boolDataDownload3 = false;
      String dataDownloads = await networkDownloadsAnswerSheet.getCheckAnswerSheet();
      modelGetDownloadsData3 = ModelGetDownloads.fromJson(jsonDecode(dataDownloads));

      modelGetDownloads3 = modelGetDownloadsData3.data;

      boolDataDownload3 = true;
      notifyListeners();
      log(modelGetDownloadsData3.data.src);
    }catch(e){
      modelGetDownloadsData3.status = 0;
      notifyListeners();
    }

    }
  }

  Future openFile({required String url, required String fileName})async{
    try{
      final file = await downloadFile(url: url, name: fileName);
      if (file == null) return;

      OpenFile.open(file.path);
    }catch(e){
      log(e.toString());
    }
  }

  Future<File?> downloadFile({required String url, required String name})async{
     final appStore = await getApplicationDocumentsDirectory();
     final file = File('${appStore.path}/$name.pdf');
     final response = await Dio().get(url,
     options: Options(
       responseType: ResponseType.bytes,
       followRedirects: false,
       receiveTimeout: 0,
     )
     );

     final raf = file.openSync(mode: FileMode.write);
     raf.writeFromSync(response.data);
     await raf.close();
     return file;

  }

}
