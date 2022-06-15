import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/person_info/certificate/set_cert/get_lang.dart';
import 'package:mydtm/data/model_parse/person_info/certificate/set_cert/languange.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/model_botton_sheet.dart';
import 'dart:developer';

class ProviderForeignLang extends ChangeNotifier {
  bool imageChange = true;
  var box = Hive.box("online");

  addImageForeign(
      {required BuildContext context,
      required ProviderForeignLang providerForeignLang}) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enableDrag: true,
      builder: (context) => Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          )),
          height: 200,
          child: ChooseImageForeignLang(providerForeignLang: providerForeignLang)),
    );
  }

  Future changeImageForeign(
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


  ///
  NetworkGetLanguages networkGetLanguages = NetworkGetLanguages();
  TextEditingController textEditingLangSearch = TextEditingController();
  List<DataGetForeignLang> listDataForeignLang = [];
  List<DataGetForeignLang> listDataForeignLangTemp = [];
  bool boolCerGetLang = false;

  Future getLanguage({required BuildContext context})async{
    try{
      boolCerGetLang = false;
      String data = await networkGetLanguages.getForeignCert();
      log(data);
      ModelGetForeignLang modelGetForeignLang = ModelGetForeignLang.fromJson(jsonDecode(data));
      listDataForeignLang = modelGetForeignLang.data;
      listDataForeignLangTemp = listDataForeignLang;
      boolCerGetLang = true;
      notifyListeners();
    }catch(e){
      log(e.toString());
    }

  }

  Future searchCertLang({required String value}) async {
    listDataForeignLangTemp.clear();
    for (var val in listDataForeignLang) {
      if (val.name.trim().toLowerCase().contains(value.trim().toLowerCase())) {
        listDataForeignLangTemp.add(val);
      }
    }
    notifyListeners();
  }

  Future clearTextCerLang() async {
    boolCerGetLang = false;
    notifyListeners();
    listDataForeignLangTemp.clear();
    textEditingLangSearch.clear();
    listDataForeignLangTemp.addAll(listDataForeignLang);
    boolCerGetLang = true;
    notifyListeners();
  }

  ///
  String certLangName = '';
  String certLangId = '';
  Future setCertLang({required String distId, required String distName}) async {
    certLangName = distName;
    certLangId = distId;
    notifyListeners();
  }

}
