import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/privillege_check.dart';
import 'package:mydtm/data/model_parse/person_info/privilege_model/invalid.dart';
import 'package:mydtm/data/model_parse/person_info/privilege_model/privilege_model1.dart';

class ProviderPrivilege extends ChangeNotifier{


  NetworkPrivilege networkPrivilege = NetworkPrivilege();
  List<DataCheckPrivilege> listCheckPrivilege = [];
  bool boolGetDataPrivilege = false;
  bool boolPrivilegeNot = false;
  bool boolAddInvalide = false;
  bool boolEditInvalide = false;

  Future getPrivilege()async{
    try{
      boolGetDataPrivilege = false;
      String dataPrivilege = await networkPrivilege.getPrivilege();
      ModelCheckPrivilege modelCheckPrivilege = ModelCheckPrivilege.fromJson(jsonDecode(dataPrivilege));

    log(dataPrivilege);
    listCheckPrivilege = modelCheckPrivilege.data;
    for(var lis in listCheckPrivilege){
      if(lis.typeId.toString() == "2"){
        boolAddInvalide = true;
        notifyListeners();
      }
    }
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