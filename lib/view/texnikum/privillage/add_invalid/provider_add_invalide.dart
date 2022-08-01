import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/invalid_add.dart';
import 'package:mydtm/data/model_parse/person_info/privilege_model/invalid.dart';
import 'package:mydtm/data/texnikum/internet/privilage.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/image_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ProviderAddInvalideTexnikum extends ChangeNotifier {
  DateTime currentDate = DateTime.now();
  String dateYearMonthDay = "";
  TextEditingController textEditingController = TextEditingController();
  final formKeyInvalide = GlobalKey<FormState>();
  String invalidType = "0";
  String invalidSerNum = "0";
  String invalidDate1 = "0";
  String invalidDate2 = "0";
  bool boolInvalidIsBlind = false;

  Future getInvallidType({required String invalidTypes}) async {
    invalidType = invalidTypes;
    notifyListeners();
  }

  Future<void> selectDate(
      {required BuildContext context, required Function fff}) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now()); //DateTime(2022,07,20));
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
        firstDate: DateTime.now(),
        // DateTime(int.parse(invalidDate1.substring(0,4)), int.parse(getMonth()), int.parse(getDay())),
        lastDate: DateTime(2063));
    if (pickedDate != null && pickedDate != currentDate) {
      currentDate = pickedDate;
      invalidDate2 = DateFormat('yyyy-MM-dd').format(currentDate);
      fff();
      notifyListeners();
    }
  }

  Future getBlind({required bool isBlind}) async {
    boolInvalidIsBlind = isBlind;
    notifyListeners();
  }

  NetworkSetPrivilegeTexnikum networkInvalidePrivilege =
  NetworkSetPrivilegeTexnikum();

  late ModelAddInvalid modelAddInvalid;

  Future sendServer({required BuildContext context}) async {


    FormData formData = FormData.fromMap({
      "ser": textEditingController.text.toString().substring(0, 2),
      "numn": textEditingController.text.toString().substring(2),
      "sdate": invalidDate1,
      "type_id": "2",//box.get("privilageTypeTexnikum"),
      "img": await MultipartFile.fromFile(fileToServer!.path,
          filename: "dtm_${textEditingController.text}.$fileName")
    });

    try {
      String data = await networkInvalidePrivilege.setPrivilegeTexnikum(
          formDate: formData);


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
    } catch (e) {
      MyWidgets.awesomeDialogError(
          context: context, valueText: "infoFillError".tr());
    }
  }

  addImageForeign(
      {required BuildContext context,
      required ProviderAddInvalideTexnikum providerAddInvalideTexnikum,
      required Function fff}) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enableDrag: true,
      builder: (context) => Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          )),
          height: 200,
          child: ChooseImageProvillageTexnikum(
              providerAddInvalideTexnikum: providerAddInvalideTexnikum,
              f: fff)),
    );
  }

  /// image
  ///
  bool boolForeignImage = false;
  File? fileToServer;
  String? fileName;
  var box = Hive.box("online");
  bool imageChange2 = true;

  Future changeImageForeign(
      {required dynamic imageData,
      required String fileTypeName,
      required File imageFile,
      required Function fff}) async {
    try {
      imageChange2 = false;
      boolForeignImage = false;
      fileToServer = imageFile;
      fileName = fileTypeName;
      box.delete("imageTexnikum");
      box.delete("imageTexnikumServer");
      box.delete("imageTexnikumServer");
      box.put("imageTexnikum", imageData!.replaceAll("\n", ""));
      box.put("imageTexnikumServer",
          "data:image/$fileTypeName;base64, ${imageData!.replaceAll("\n", "")}");
      await Future.delayed(const Duration(milliseconds: 400)).then((value) {
        imageChange2 = true;
      });
      boolForeignImage = true;
      fff();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
