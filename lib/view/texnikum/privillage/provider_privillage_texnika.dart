// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/invalid_delete.dart';
import 'package:mydtm/data/texnikum/internet/privilage/get_all_info.dart';
import 'package:mydtm/data/texnikum/models/privillage/get_privilage.dart';

class ProviderPrivilegeTexnikum extends ChangeNotifier{


  NetworkGetAllPrivilegeTexnikum networkGetAllPrivilegeTexnikume = NetworkGetAllPrivilegeTexnikum();
  late MassagePrivilageTexnikum massagePrivilageTexnikum;
  bool boolGetDataPrivilege = false;
  bool boolPrivilegeNot = false;
  bool boolAddInvalide = false;
  bool boolEditInvalide = false;
  late ModelGetPrivilageTexnikum modelGetPrivilageTexnikum;

  Future getPrivilegeTexnikum()async{
    try{
      boolGetDataPrivilege = false;
      String dataPrivilege = await networkGetAllPrivilegeTexnikume.getPrivilegeTexnikum();
      modelGetPrivilageTexnikum = ModelGetPrivilageTexnikum.fromJson(jsonDecode(dataPrivilege));

      log(dataPrivilege);
      massagePrivilageTexnikum = modelGetPrivilageTexnikum.masseage;
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
       await networkInvalideDelete.deleteInvalide();
      Navigator.of(context).pop();

    }catch(e){throw Exception(e.toString());}
  }

}