import 'dart:io';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart' as pw;

class ProviderImageToPDF extends ChangeNotifier {
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

  // Future<File> createPdfFile({required BuildContext contexts}) async {
  //   var pdf = pw.Document();
  //   pdf.addPage(pw.MultiPage(
  //     crossAxisAlignment: pw.CrossAxisAlignment.center,
  //     mainAxisAlignment: pw.MainAxisAlignment.center,
  //     build: (context) =>
  //     [
  //
  //       pw.SizedBox(
  //         // height: MediaQuery.of(contexts).size.height * 0.9,
  //         // width: MediaQuery.of(contexts).size.width * 0.9,
  //         child: pw.Image(
  //           pw.MemoryImage(
  //             base64Decode(
  //               listImagesByte[0],
  //             ),
  //           ),
  //           fit: pw.BoxFit.fill,
  //         ),
  //       ),
  //       listImagesByte.length >= 2 ?
  //       pw.SizedBox(
  //         // height: MediaQuery.of(contexts).size.height * 0.9,
  //         // width: MediaQuery.of(contexts).size.width * 0.9,
  //
  //         child: pw.Image(
  //
  //           pw.MemoryImage(
  //             base64Decode(
  //               listImagesByte[1],
  //             ),
  //           ),
  //           fit: pw.BoxFit.fill,
  //         ),
  //       ) : pw.SizedBox.shrink(),
  //
  //       listImagesByte.length <= 3 ?
  //       pw.SizedBox(
  //         // height: MediaQuery.of(contexts).size.height * 0.9,
  //         // width: MediaQuery.of(contexts).size.width * 0.9,
  //         child: pw.Image(
  //           pw.MemoryImage(
  //             base64Decode(
  //               listImagesByte[2],
  //             ),
  //           ),
  //           fit: pw.BoxFit.fill,
  //         ),
  //       ) : pw.SizedBox.shrink(),
  //     ],
  //   ));
  //
  //   return saveDocument(name: "dtm2", pdf: pdf);
  // }

  Future openFiles(File file) async {
    // final url = file.path;
    // await OpenFile.open(url);
  }

  //
  //
  // Future<File> saveDocument(
  //     {required String name, required pw.Document pdf}) async {
  //   final bytes = await pdf.save();
  //   final dir = await getApplicationDocumentsDirectory();
  //   final file = File("${dir.path}/$name");
  //   await file.writeAsBytes(bytes);
  //   return file;
  // }

  Future deleteItemList({required int index}) async {
    listImagesPDF.removeAt(index);
    listImagesByte.removeAt(index);
    listFiles.removeAt(index);
    notifyListeners();
  }

}