// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/answersheet.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/ariza_check.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/qayd_varaqa.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/ruxsanoma.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/data/model_parse/m4_qayd_var/downloads.dart';
import 'package:mydtm/data/model_parse/m4_qayd_var/model_qayd_varaqa.dart';
import 'package:ntp/ntp.dart';
import 'package:path_provider/path_provider.dart';

class ProviderAriza extends ChangeNotifier {
  NetworkArizaCheck networkArizaCheck = NetworkArizaCheck();
  late Model model;
  late Person person;
  bool boolQaydVaraqaDownload = false;
  bool boolQaydVaraqaDownloadNot = false;
  bool boolBitiruvchi = false;

  // Load from assets

// Load from URL
  late PDFDocument doc;
  late PDFDocument doc2;
  late PDFDocument doc3;

// Load from file

  Future getQaydVaraqa() async {
    try {
      boolQaydVaraqaDownload = false;
      String dataAriza = await networkArizaCheck.getCheckAriza();
      ModelArizaQadVaraqa modelArizaQadVaraqa =
          ModelArizaQadVaraqa.fromJson(jsonDecode(dataAriza));

      DataArizaQadVaraqa dataArizaQadVaraqa = modelArizaQadVaraqa.dataArizaQadVaraqa;
      model = dataArizaQadVaraqa.model;
      if (model.invoice == null  ) {
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

  NetworkDownloadsQaydVaraqa networkDownloadsQaydVaraqa =
      NetworkDownloadsQaydVaraqa();
  NetworkDownloadsRuxsatnoma networkDownloadsRuxsatnoma =
      NetworkDownloadsRuxsatnoma();
  NetworkDownloadsAnswerSheet networkDownloadsAnswerSheet =
      NetworkDownloadsAnswerSheet();
  late ModelGetDownloads modelGetDownloadsData1;
  late ModelGetDownloads modelGetDownloadsData2;
  late ModelGetDownloads modelGetDownloadsData3;

  late DataGetDownloads modelGetDownloads1;
  late DataGetDownloads modelGetDownloads2;
  late DataGetDownloads modelGetDownloads3;
  bool boolDataDownload1 = false;
  bool boolDataDownload2 = false;
  bool boolDataDownload3 = false;
 late DateTime myTime;
 int day = 0;
 int month = 0;
  Future getDownloads({required int categoryId}) async {
    /// String url o'zgartirish kerak
    if (categoryId == 1) {
      try {
        boolDataDownload1 = false;
        String dataDownloads =
            await networkDownloadsQaydVaraqa.getCheckDownloads();
        modelGetDownloadsData1 =
            ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
        modelGetDownloads1 = modelGetDownloadsData1.data;
        doc = await PDFDocument.fromURL(modelGetDownloads1.src,
            headers: {"X-Access-Token": box.get("token")},
            cacheManager: CacheManager(
              Config(
                "customCacheKey",
                stalePeriod: const Duration(milliseconds: 600),
                maxNrOfCacheObjects: 1,
              ),)
        );

        myTime = await NTP.now();
         day = myTime.day;
         month = myTime.month;
         // log(myTime.timeZoneName);
         // log(myTime.month.toString());
         // log(myTime.day.toString());
         // log(myTime.hour.toString());
         // log(myTime.minute.toString());
        boolDataDownload1 = true;
        notifyListeners();
        // log(modelGetDownloadsData1.data.src);
      } catch (e) {
        modelGetDownloadsData1.status = 0;
        log(e.toString());
      }
    } else if (categoryId == 2) {
      try {
        boolDataDownload2 = false;
        String dataDownloads =
            await networkDownloadsRuxsatnoma.getCheckDownloads();
        modelGetDownloadsData2 =
            ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
        modelGetDownloads2 = modelGetDownloadsData2.data;
        doc2 = await PDFDocument.fromURL(modelGetDownloads1.src,
            headers: {"X-Access-Token": box.get("token")},
            cacheManager: CacheManager(
              Config(
                "customCacheKey",
                stalePeriod: const Duration(milliseconds: 600),
                maxNrOfCacheObjects: 1,
              ),)
        );
        boolDataDownload2 = true;
        notifyListeners();
      } catch (e) {
        modelGetDownloadsData2.status = 0;
      }
    } else if (categoryId == 3) {
      try {
        boolDataDownload3 = false;
        String dataDownloads =
            await networkDownloadsAnswerSheet.getCheckAnswerSheet();
        modelGetDownloadsData3 =
            ModelGetDownloads.fromJson(jsonDecode(dataDownloads));

        modelGetDownloads3 = modelGetDownloadsData3.data;
        doc3 = await PDFDocument.fromURL(modelGetDownloads3.src,
            headers: {"X-Access-Token": box.get("token")},
            cacheManager: CacheManager(
              Config(
                "customCacheKey",
                stalePeriod: const Duration(milliseconds: 600),
                maxNrOfCacheObjects: 1,
              ),)
        );
        boolDataDownload3 = true;
        notifyListeners();
        log(modelGetDownloadsData3.data.src);
      } catch (e) {
        modelGetDownloadsData3.status = 0;
        notifyListeners();
      }
    }
  }

  Future openFile({required String url, required String fileName}) async {
    try {
      final file = await downloadFile(url: url, name: fileName);
      if (file == null) return;

      // OpenFile.open(file.path);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<File?> downloadFile(
      {required String url, required String name}) async {

    final appStore = await getApplicationDocumentsDirectory();
    final file = File('${appStore.path}/$name.pdf');
    final response = await Dio().get(url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(seconds: 60),
        ));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    // if (Platform.isIOS || Platform.isAndroid) {
    //   bool status = await Permission.storage.isGranted;
    //
    //   if (!status) await Permission.storage.request();
    // }
    // file.existsSync();
    // // FileUtils.mkdir([dirloc]);
    // String path = await FileSaver.instance.saveFile(
    //   link: LinkDetails(link: url),
    //     // filePath: "/storage/download/",
    //
    //     name: "BMBA",
    //     //link:  linkController.text,
    //     // bytes: Uint8List.fromList(response.data.encode()!),
    //     ext: 'pdf',
    //
    //     ///extController.text,
    //     mimeType: MimeType.pdf);
    //   log(path);
    // await FileSaver.instance.saveFile({
    //   required String name,
    //   Uint8List? bytes,
    //   File? file,
    //   String? filePath,
    //   LinkDetails? link,
    //   String ext = "",
    //   MimeType mimeType = MimeType.other,
    //   String? customMimeType
    // });

    return file;
  }

  ///

  bool loading = false;
  double progress = 0;
  final Dio dio = Dio();

  late Directory directory;

  Future<bool> downloadFiles(
      {required String url, required String fileName}) async {
    try {
      if (Platform.isAndroid) {
        directory = (await getExternalStorageDirectory())!;
        String newPath = "";
        List<String> folders = directory.path.split("/");

        for (int x = 1; x < folders.length; x++) {
          String folder = folders[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }

          newPath = "$newPath/BBA";
          directory = Directory(newPath);
        }
        // }
        // else{return false;}

        // }

        // if(await requestPermission()){
        //   directory  = await getTemporaryDirectory();
        //
        //   return false;
        //   }
      }
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        File saveFile = File("${directory.path}/$fileName");
        await dio.download(url, saveFile.path,
            onReceiveProgress: (downloaded, totalSize) {
          progress = downloaded / totalSize;
          notifyListeners();
        });

        if (Platform.isIOS) {
          // await ImageGallerySaver.saveFile(saveFile.path, isReturnPathOfIOS: true);
          notifyListeners();
        }
        return true;
      }
      notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    }

    return false;
  }

  DateTime now = DateTime.now();
  var box = Hive.box("online");

  // DateTime date =  DateTime(now.year, now.month, now.day);
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  Future download({required String urls, required String fileName}) async {
    loading = false;
    progress = 0;
    notifyListeners();

    try {
      await FileSaver.instance.saveFile(
          name: "bmba_${DateFormat('yyyy-MM-dd – kk:mm').format(now)}.pdf",
          link: LinkDetails(
              link: urls, headers: {MainUrl.mainUrlHeader: box.get("token")}));
      //   {
      //     required String name,
      // Uint8List? bytes,
      // File? file,
      // String? filePath,
      // LinkDetails? link,
      // String ext = "",
      // MimeType mimeType = MimeType.other}
      //    await downloadFiles(url: urls, fileName: fileName);
    } catch (e) {
      throw Exception(e.toString());
    }
    loading = true;
    notifyListeners();
  }

// Future<bool> requestPermission() async {
//
//     var result = await permission.request();
//     if (result == PermissionStatus.granted) {
//       return true;
//     } else {
//       return false;
//     }
}
// }
// }
