// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/ariza_check.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/invalid_delete.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/privillege_check.dart';
import 'package:mydtm/data/model_parse/m4_qayd_var/model_qayd_varaqa.dart';
import 'package:mydtm/data/model_parse/person_info/privilege_model/list_add_privilages.dart';
import 'package:mydtm/data/model_parse/person_info/privilege_model/privilege_model1.dart';

class ProviderPrivilege extends ChangeNotifier {
  NetworkPrivilege networkPrivilege = NetworkPrivilege();
  List<DataCheckPrivilege> listCheckPrivilege = [];
  late DataArizaQadVaraqa listCheckPrivilege2;
  bool boolGetDataPrivilege = false;
  bool boolPrivilegeNot = false;
  bool boolAddInvalide = false;
  bool boolEditInvalide = false;

  NetworkArizaCheck networkArizaCheck = NetworkArizaCheck();
  List<DataArizaQadVaraqa> listDataEnd = [];
  List<ListAddPrivilagesAll> listAddPrivilagesAll = [];

  getPrivilege() async {
    try {
      boolGetDataPrivilege = false;
      String dataAriza = await networkArizaCheck.getCheckAriza();
      ModelArizaQadVaraqa modelArizaQadVaraqa =
          ModelArizaQadVaraqa.fromJson(jsonDecode(dataAriza));

      // String dataPrivilege = await networkPrivilege.getPrivilege();
      // ModelCheckPrivilege modelCheckPrivilege =
      //     ModelCheckPrivilege.fromJson(jsonDecode(dataPrivilege));

      // log(dataPrivilege);
      listCheckPrivilege2 = modelArizaQadVaraqa.dataArizaQadVaraqa;
      try {
        for (int i = 0;
            i < modelArizaQadVaraqa.dataArizaQadVaraqa.imtiyozList.length;
            i++) {
          listAddPrivilagesAll.add(ListAddPrivilagesAll(
            startDate: modelArizaQadVaraqa
                .dataArizaQadVaraqa.imtiyozList[i].startDate
                .toString(),
            endDate: modelArizaQadVaraqa
                .dataArizaQadVaraqa.imtiyozList[i].startDate
                .toString(),
            serNum: modelArizaQadVaraqa.dataArizaQadVaraqa.imtiyozList[i].ser
                    .toString() +
                modelArizaQadVaraqa.dataArizaQadVaraqa.imtiyozList[i].num
                    .toString(),
            typeName: modelArizaQadVaraqa.dataArizaQadVaraqa.imtiyozList[i].name
                .toString(),
          ));
        }
      } catch (e) {
        log(e.toString());
      }

      try {
        for (int i = 0;
            i < modelArizaQadVaraqa.dataArizaQadVaraqa.xarbiy.length;
            i++) {
          listAddPrivilagesAll.add(ListAddPrivilagesAll(
            startDate: modelArizaQadVaraqa
                .dataArizaQadVaraqa.xarbiy[i].startDate
                .toString(),
            endDate: modelArizaQadVaraqa.dataArizaQadVaraqa.xarbiy[i].startDate
                .toString(),
            serNum: modelArizaQadVaraqa.dataArizaQadVaraqa.xarbiy[i].ser
                    .toString() +
                modelArizaQadVaraqa.dataArizaQadVaraqa.xarbiy[i].num.toString(),
            typeName: modelArizaQadVaraqa.dataArizaQadVaraqa.xarbiy[i].typeName
                .toString(),
          ));
        }
      } catch (e) {
        log(e.toString());
      }

      try {
        listAddPrivilagesAll.add(ListAddPrivilagesAll(
          startDate: modelArizaQadVaraqa
              .dataArizaQadVaraqa.invalidList.startDate
              .toString(),
          endDate: modelArizaQadVaraqa.dataArizaQadVaraqa.invalidList.startDate
              .toString(),
          serNum: modelArizaQadVaraqa.dataArizaQadVaraqa.invalidList.serNum
              .toString(),
          typeName: modelArizaQadVaraqa.dataArizaQadVaraqa.invalidList.typeName
              .toString(),
        ));
      } catch (e) {
        log(e.toString());
      }

      boolGetDataPrivilege = true;
      notifyListeners();
    } catch (e) {
      boolPrivilegeNot = true;
      boolGetDataPrivilege = true;
      notifyListeners();
      log(e.toString());
    }
  }

  NetworkInvalideDelete networkInvalideDelete = NetworkInvalideDelete();

  deleteInvalid({required BuildContext context}) async {
    try {
      await networkInvalideDelete.deleteInvalide();
      Navigator.of(context).pop();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
