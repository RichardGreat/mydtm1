import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/privillege_check.dart';
import 'package:mydtm/data/model_parse/person_info/privilege_model/privilege_model1.dart';

class ProviderPrivilege extends ChangeNotifier{


  NetworkPrivilege networkPrivilege = NetworkPrivilege();
  List<DataCheckPrivilege> listCheckPrivilege = [];
  bool boolGetDataPrivilege = false;
  bool boolPrivilegeNot = false;
  Future getPrivilege()async{
    try{
      boolGetDataPrivilege = false;
      String dataPrivilege = await networkPrivilege.getPrivilege();
    ModelCheckPrivilege modelCheckPrivilege = ModelCheckPrivilege.fromJson(jsonDecode(dataPrivilege));
    listCheckPrivilege = modelCheckPrivilege.data;
      boolGetDataPrivilege = true;
      notifyListeners();
    }catch(e){

      boolPrivilegeNot = true;
      boolGetDataPrivilege = true;
      notifyListeners();
      log(e.toString());
    }

  }

}