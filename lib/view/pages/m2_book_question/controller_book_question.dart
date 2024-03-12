import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mydtm/data/internet_connections/m3_home/internet_subjects.dart';
import 'package:mydtm/data/model_parse/m3_home/model_get_subject.dart';

class ControllerBookQuestion extends ChangeNotifier{
  /// subject terib olish
  NetworkSubjectList   networkSubjectList = NetworkSubjectList();
  List<ModelSubjectGet> listModelSubjectGet = [];

  bool boolGetDataQuestion = false;
  Future getDataQuestionBook()async{
    try {
      boolGetDataQuestion = false;
      String data = await networkSubjectList.getSubjectList();
      log("###");
      log(jsonEncode(jsonDecode(jsonDecode(data))));
      log("###");
      listModelSubjectGet = (jsonDecode(jsonDecode(data)) as List)
          .map((e) => ModelSubjectGet.fromJson(e))
          .toList();
      boolGetDataQuestion = true;
      notifyListeners();
    } catch (e) {
      log("###7");
      log(e.toString());
    }
    // for (int i = 0; i < listModelSubjectGet.length; i++) {
    //   listDataServiceListSubject.add(ServiceMainList(
    //       id: "88888888",
    //       serviceName: listModelSubjectGet[i].subjectName,
    //       serviceText: listModelSubjectGet[i].subjectName,
    //       serviceTextRu: listModelSubjectGet[i].subjectName,
    //       serviceTextQQ: listModelSubjectGet[i].subjectName,
    //       serviceNameRu: listModelSubjectGet[i].subjectName,
    //       serviceNameQQ: listModelSubjectGet[i].subjectName,
    //       status: true,
    //       mobilIcon: listModelSubjectGet[i].subjectImgLink,
    //       link: listModelSubjectGet[i].pdfLink,
    //       icon: listModelSubjectGet[i].subjectImgLink,
    //       catId: "$i",
    //       cod: "$i",
    //       sortId: "$i",
    //       createdAt: "2023",
    //       updatedAt: "2024",
    //       deleted: "1"));
    // }
  }
}