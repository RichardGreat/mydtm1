import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/invalid_delete.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/privillege_check.dart';
import 'package:mydtm/data/model_parse/person_info/privilege_model/privilege_model1.dart';

class ProviderPrivilegeTexnikum extends ChangeNotifier{


  NetworkPrivilege networkPrivilege = NetworkPrivilege();
  List<DataCheckPrivilege> listCheckPrivilege = [];
  bool boolGetDataPrivilege = false;
  bool boolPrivilegeNot = false;
  bool boolAddInvalide = false;
  bool boolEditInvalide = false;

  Future getPrivilegeTexnikum()async{
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
        if(lis.status.toString() == "7"){
          boolEditInvalide = true;
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

  NetworkInvalideDelete networkInvalideDelete = NetworkInvalideDelete();
  Future deleteInvalidTexnikum({required BuildContext context})async{
    try{
      String dataDelete = await networkInvalideDelete.deleteInvalide();
      Navigator.of(context).pop();

    }catch(e){}
  }

}