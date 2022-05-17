import 'package:flutter/material.dart';

class ProviderGraduated extends ChangeNotifier {

  final formKeyGraduated = GlobalKey<FormState>();

  bool boolUzbekGraduated = true;

  /// graduated type
  String graduatedName = "", graduatedId = "";
  bool boolGraduatedType = true;
  Future setGraduatedType({required String id, required String name})async{
    graduatedName = name;
    graduatedId = id;
    if(graduatedId == "4"){
      boolGraduatedType = false;
    }else{
      boolGraduatedType = true;
    }
    notifyListeners();
  }

}