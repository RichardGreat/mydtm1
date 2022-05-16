import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/sign_up.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';

class ProviderEnterFirst extends ChangeNotifier {
  bool boolPasswordVisible = false;
  final formKey = GlobalKey<FormState>();
  bool myBoolWidget = false;
  bool boolButtonColor1 = false;

  Future boolButtonCol1({required bool boolValue}) async {
    boolButtonColor1 = boolValue;
  }

  Future boolPasswordVisibleMethod() async {
    boolPasswordVisible = !boolPasswordVisible;
    notifyListeners();
  }

  Future enterSignUp({required BuildContext context}) async {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const SignUp(),
        ));
  }
  Future enterPersonPassport({required BuildContext context}) async {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const PersonInformation(),
        ));
  }

}
