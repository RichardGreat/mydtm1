import 'package:flutter/cupertino.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';

class ProviderPersonInfo extends ChangeNotifier{
  final formKey123 = GlobalKey<FormState>();
  TextEditingController txtJShShIRController = TextEditingController();
  TextEditingController txtPsSerController = TextEditingController();
  TextEditingController txtPsNumController = TextEditingController();


  Future getWindow({required BuildContext context})async{
    Navigator.of(context).pop();
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const AddressInfo(),
        ));

  }

  ///
  String nationIds ="", nationNames="";
  Future setNation({required String nationId, required String nationName})async{
    nationIds = nationId;
    nationNames = nationName;
    boolNationChoose(boolNation: true);
    notifyListeners();
  }
  /// for Button color
  bool myBoolWidget = false;
  bool boolJShShIR = false;
  bool boolPsSer = false;
  bool boolPsNum = false;
  bool boolChooseNation = false;

  Future boolShShIR({required bool boolShiR})async{
  boolJShShIR = boolShiR;
}
  Future boolPsSera({required bool boolSer})async{
    boolPsSer = boolSer;
  }
  Future boolPsNumber({required bool boolNum})async{
    boolPsNum = boolNum;
  }
  Future boolNationChoose({required bool boolNation})async{
    boolChooseNation = boolNation;
  }

  // Future boolPasswordVisibleMethod() async {
  //   boolPasswordVisible = !boolPasswordVisible;
  //   notifyListeners();
  // }
}