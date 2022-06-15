import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/ariza_check.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/downloads_url.dart';
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
      boolQaydVaraqaDownloadNot = true;
      boolQaydVaraqaDownload = true;
      notifyListeners();
      log(e.toString());
    }
  }

  NetworkDownloads networkDownloads = NetworkDownloads();
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
        String dataDownloads = await networkDownloads.getCheckDownloads();
        ModelGetDownloads modelGetDownloads =
            ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
        modelGetDownloads1 = modelGetDownloads.data;
        boolDataDownload1 = true;
        notifyListeners();
        log(modelGetDownloads.data.src);
      }catch(e){log(e.toString());}
    } else if (categoryId == 2) {
      boolDataDownload2 = false;
      String dataDownloads = await networkDownloads.getCheckDownloads();
      ModelGetDownloads modelGetDownloads = ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
      modelGetDownloads2 = modelGetDownloads.data;
      boolDataDownload2 = true;
      notifyListeners();
      log(modelGetDownloads.data.src);
    } else if (categoryId == 3) {
      boolDataDownload3 = false;
      String dataDownloads = await networkDownloads.getCheckDownloads();
      ModelGetDownloads modelGetDownloads = ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
      modelGetDownloads3 = modelGetDownloads.data;
      boolDataDownload3 = true;
      notifyListeners();
      log(modelGetDownloads.data.src);

    }
  }



  Future openFile({required String url, required String fileName})async{
    try{
      final file = await downloadFile(url: url, name: fileName);
      if (file == null) return;
      print("path: ${file.path}");
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
