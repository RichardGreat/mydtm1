import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProviderPersonInfo extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();
  bool myBoolWidget = false;
  bool boolButtonColor1 = false;
  bool boolPasswordVisible = false;

  Future boolButtonCol1({required bool boolValue}) async {
    boolButtonColor1 = boolValue;
  }

  Future boolPasswordVisibleMethod() async {
    boolPasswordVisible = !boolPasswordVisible;
    notifyListeners();
  }
}