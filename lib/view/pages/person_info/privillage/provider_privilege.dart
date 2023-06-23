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

  //
  // NetworkPrivilege networkPrivilege = NetworkPrivilege();
  // List<DataCheckPrivilege> listCheckPrivilege = [];
  // bool boolGetDataPrivilege = false;
  // bool boolPrivilegeNot = false;

  Future getPrivilege() async {
    try {
      boolGetDataPrivilege = false;
      String dataPrivilege = await networkPrivilege.getPrivilege();
      log(dataPrivilege);
      ModelCheckPrivilege modelCheckPrivilege =
          ModelCheckPrivilege.fromJson(jsonDecode(dataPrivilege));
      listCheckPrivilege = modelCheckPrivilege.data;

      if (listCheckPrivilege.isEmpty) {
        boolPrivilegeNot = true;
        notifyListeners();
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
