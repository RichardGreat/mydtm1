import 'package:flutter/material.dart';

class ProviderChangePasswordInputs extends ChangeNotifier{

  TextEditingController textEditingPass1 = TextEditingController();
  TextEditingController textEditingPass2 = TextEditingController();


  bool boolButtonColor1 = false;
  Future boolButtonCol1({required bool boolValue}) async {
    boolButtonColor1 = boolValue;
  }

  bool boolButtonColor2 = false;

  Future boolButtonCol2({required bool boolValue}) async {
    boolButtonColor2 = boolValue;
  }

  bool boolPasswordVisible = true;
  bool boolPasswordVisible2 = true;

  Future boolPasswordVisibleMethod() async {
    boolPasswordVisible = !boolPasswordVisible;
    notifyListeners();
  }

  Future boolPasswordVisibleMethod2() async {
    boolPasswordVisible2 = !boolPasswordVisible2;
    notifyListeners();
  }

  bool boolPasswordBtnColor = false;

  Future passwordButtonColor({required bool boolBtnCol}) async {
    boolPasswordBtnColor = boolBtnCol;
    notifyListeners();
  }


}