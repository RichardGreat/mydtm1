import 'dart:convert';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/invalid_add.dart';
import 'package:mydtm/data/model_parse/person_info/privilege_model/invalid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ProviderAddInvalide extends ChangeNotifier{
  DateTime currentDate = DateTime.now();
  String dateYearMonthDay = "";
  TextEditingController textEditingController = TextEditingController();
  final formKeyInvalide = GlobalKey<FormState>();
  String invalidType = "0";
  String invalidSerNum = "0";
  String invalidDate1 = "0";
  String invalidDate2 = "0";
  bool boolInvalidIsBlind = false;


  Future getInvallidType({required String invalidTypes})async    {
    invalidType = invalidTypes;
    notifyListeners();
  }

  Future<void> selectDate(
      {required BuildContext context, required Function fff}) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate:  DateTime.now(),
        firstDate: DateTime(1980),
        lastDate:  DateTime.now());//DateTime(2022,07,20));
    if (pickedDate != null && pickedDate != currentDate) {
      currentDate = pickedDate;
      invalidDate1 = DateFormat('yyyy-MM-dd').format(currentDate);
      fff();
      notifyListeners();
    }
  }


  Future<void> selectDate2(
      {required BuildContext context, required Function fff}) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:  DateTime.now(),// DateTime(int.parse(invalidDate1.substring(0,4)), int.parse(getMonth()), int.parse(getDay())),
        lastDate: DateTime(2063));
    if (pickedDate != null && pickedDate != currentDate) {
      currentDate = pickedDate;
      invalidDate2 = DateFormat('yyyy-MM-dd').format(currentDate);
      fff();
      notifyListeners();
    }
  }

  Future getBlind({required bool isBlind})async{
    boolInvalidIsBlind = isBlind;
    notifyListeners();
  }

  NetworkInvalidePrivilege networkInvalidePrivilege = NetworkInvalidePrivilege();

  late ModelAddInvalid modelAddInvalid;
  Future sendServer({required BuildContext context})async{
  Map<String, String> dataMap={
    "group_id":invalidType,
    "ser_num":textEditingController.text.toString(),
    "given_date":invalidDate1,
    "issued_date":invalidDate2,
    "is_blind":boolInvalidIsBlind?"1":"0"

  };

    try{
    String data = await networkInvalidePrivilege.setInvalide(dataInvalid: jsonEncode(dataMap).toString());
    modelAddInvalid = ModelAddInvalid.fromJson(jsonDecode(data));
    AwesomeDialog(
        context: context,
        dialogType: DialogType.NO_HEADER,
        animType: AnimType.BOTTOMSLIDE,
        dismissOnTouchOutside: false,
        title: "DTM",
        desc: "saved".tr(),
        titleTextStyle: TextStyle(
            color: MyColors.appColorBlue1(),
            fontSize: 24,
            fontWeight: FontWeight.bold),
        descTextStyle: TextStyle(
            color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
        btnCancelOnPress: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();

        },
        btnCancelColor: MyColors.appColorBlue1(),
        btnCancelText: "OK")
        .show();

    }catch(e){
      MyWidgets.awesomeDialogError(context: context, valueText: "infoFillError".tr());
    }

  }
}