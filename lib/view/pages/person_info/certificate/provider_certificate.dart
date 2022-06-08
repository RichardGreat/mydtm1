import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/person_info/certificate/foreign_cert.dart';
import 'package:mydtm/data/internet_connections/person_info/certificate/national_certificate.dart';
import 'package:mydtm/data/model_parse/person_info/certificate/foreign_cert.dart';
import 'package:mydtm/data/model_parse/person_info/certificate/national_cert.dart';

class ProviderCertificate extends ChangeNotifier {
  bool imageChange = true;
  var box = Hive.box("online");

  //
  NetworkNationalCert networkNationalCert = NetworkNationalCert();
  List<DataCheckCertificate> listCheckCertificate =[];
  bool boolCheckCertificateData = false;

  Future getNationCertInfo() async {
    try {
      boolCheckCertificateData = false;
      String dataCert = await networkNationalCert.getNationalCert();
      ModelCheckCertificate modelCheckCertificate =
          ModelCheckCertificate.fromJson(jsonDecode(dataCert));
      listCheckCertificate = modelCheckCertificate.data;

      boolCheckCertificateData = true;
      notifyListeners();

    } catch (e) {}
  }

  // lang cert
  NetworkForeignCert networkForeignCert = NetworkForeignCert();
  late ModelCheckForeignCertificate modelCheckForeignCertificate;
  late DataCheckForeignCertificate dataCheckForeignCertificate;
  bool boolCheckForeignLang = false;
  bool boolCheckForeignLangNot = false;

  Future getForeignCert()async{
    try{
      boolCheckForeignLang = false;
      String dataCertForeign = await networkForeignCert.getForeignCert();
      modelCheckForeignCertificate = ModelCheckForeignCertificate.fromJson(jsonDecode(dataCertForeign));
      dataCheckForeignCertificate = modelCheckForeignCertificate.data;
      boolCheckForeignLang = true;
      notifyListeners();
    }catch(e){
      log(e.toString());
      boolCheckForeignLangNot = true;
      // boolCheckForeignLang = true;

      notifyListeners();
    }
  }

  Future changeImage(
      {required dynamic imageData, required String fileTypeName}) async {
    imageChange = false;
    box.delete("image");
    box.delete("imageServer");
    box.put("image", imageData!.replaceAll("\n", ""));
    box.put("imageServer",
        "image:data:image/$fileTypeName;base64, ${imageData!.replaceAll("\n", "")}");
    await Future.delayed(const Duration(milliseconds: 400)).then((value) {
      imageChange = true;
    });
    notifyListeners();
  }
// Future showImage(
//     {required BuildContext context,
//       required ProviderCertificate providerCertificate}) async {
//   showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(5),
//                 topLeft: Radius.circular(5),
//               )),
//           actions: [
//             Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(5),
//                       topLeft: Radius.circular(5),
//                     )),
//                 child: DataTimePic(
//                     providerCertificate: providerCertificate))
//           ]));
// }

}
