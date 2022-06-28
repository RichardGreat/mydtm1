import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class ScreenLockWindow extends StatefulWidget {
  String idScreenLockWindow = "";

  ScreenLockWindow({Key? key, required this.idScreenLockWindow})
      : super(key: key);

  @override
  State<ScreenLockWindow> createState() => _ScreenLockWindowState();
}

class _ScreenLockWindowState extends State<ScreenLockWindow> {
  TextEditingController textEditingController = TextEditingController();

  var box = Hive.box("online");
  final formKey = GlobalKey<FormState>();
  bool boolChangePassword = false;

  String textBody() {
    return widget.idScreenLockWindow == "0"
        ? "Pin kod 4 raqamdan iborat kod kiriting"
        : widget.idScreenLockWindow == "1"
            ? "Parol almashtirish uchun pin kodni kiriting"
            : "Parolni o'chirish uchun pin kodni kiriting";
  }

  checkInputs({required String textInputLock}) {
    widget.idScreenLockWindow == "0"
        ? {
      box.put("lockScreen", textEditingController.text.toString().trim()),
      AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.BOTTOMSLIDE,
          title: "DTM",
          body: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  "saved".tr(),
                  style: TextStyle(
                      fontSize: 20,
                      color: MyColors.appColorBlack()),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          titleTextStyle: TextStyle(
              color: MyColors.appColorBlue1(),
              fontSize: 24,
              fontWeight: FontWeight.bold),
          descTextStyle: TextStyle(
              color: MyColors.appColorBlack(),
              fontWeight: FontWeight.bold),
          btnCancelColor: MyColors.appColorBlue1(),
          btnCancelText: "Ok",
          btnCancelOnPress: () {
            Navigator.of(context).pop();
          })
          .show(),

    }
        : widget.idScreenLockWindow == "1"
            ? {
                /// Parol almashtirish
                if (box.get("lockScreen").toString().trim() == textInputLock)
                  {
                    boolChangePassword = true,
                    textEditingController.clear(),
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.NO_HEADER,
                        animType: AnimType.BOTTOMSLIDE,
                        title: "DTM",
                        body: Container(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Text(
                                "Yangi parol kiriting",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: MyColors.appColorBlack()),
                              ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                        titleTextStyle: TextStyle(
                            color: MyColors.appColorBlue1(),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        descTextStyle: TextStyle(
                            color: MyColors.appColorBlack(),
                            fontWeight: FontWeight.bold),
                        btnCancelColor: MyColors.appColorBlue1(),
                        btnCancelText: "Ok",
                        btnCancelOnPress: () {

                        }).show(),
                  }
                else
                  {
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            animType: AnimType.BOTTOMSLIDE,
                            title: "DTM",
                            body: Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    "Parol xato qayta uruning",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: MyColors.appColorBlack()),
                                  ),
                                  const SizedBox(height: 25),
                                ],
                              ),
                            ),
                            titleTextStyle: TextStyle(
                                color: MyColors.appColorBlue1(),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            descTextStyle: TextStyle(
                                color: MyColors.appColorBlack(),
                                fontWeight: FontWeight.bold),
                            btnCancelColor: MyColors.appColorBlue1(),
                            btnCancelText: "Ok",
                            btnCancelOnPress: () {})
                        .show(),
                  }
              }
            : widget.idScreenLockWindow == "2"
                ? {
                    /// Parol o'chirish
                    if (box.get("lockScreen").toString().trim() ==
                        textInputLock)
                      {
                        box.delete("lockScreen"),
                        // box.put("lockScreen", textInputLock),
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            animType: AnimType.BOTTOMSLIDE,
                            title: "DTM",
                            body: Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    "parol o'chirildi",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: MyColors.appColorBlack()),
                                  ),
                                  const SizedBox(height: 25),
                                ],
                              ),
                            ),
                            titleTextStyle: TextStyle(
                                color: MyColors.appColorBlue1(),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            descTextStyle: TextStyle(
                                color: MyColors.appColorBlack(),
                                fontWeight: FontWeight.bold),
                            btnCancelColor: MyColors.appColorBlue1(),
                            btnCancelText: "Ok",
                            btnCancelOnPress: () {
                              Navigator.of(context).pop();
                            }).show(),
                      }
                    else
                      {
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            animType: AnimType.BOTTOMSLIDE,
                            title: "DTM",
                            body: Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    "Parol xato qayta uruning",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: MyColors.appColorBlack()),
                                  ),
                                  const SizedBox(height: 25),
                                ],
                              ),
                            ),
                            titleTextStyle: TextStyle(
                                color: MyColors.appColorBlue1(),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            descTextStyle: TextStyle(
                                color: MyColors.appColorBlack(),
                                fontWeight: FontWeight.bold),
                            btnCancelColor: MyColors.appColorBlue1(),
                            btnCancelText: "Ok",
                            btnCancelOnPress: () {
                              Navigator.of(context).pop();
                            }).show(),
                      }
                  }
                : {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
        backgroundColor: MyColors.appColorWhite(),
        iconTheme: IconThemeData(color: MyColors.appColorBlack()),
        elevation: 0,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(15),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyWidgets.robotoFontText(
                    text:
                        !boolChangePassword ? textBody() : "newPassword".tr()),
                const SizedBox(height: 10),
                TextFormField(
                  controller: textEditingController,
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: const Icon(Icons.clear, size: 12),
                      onTap: () {
                        textEditingController.clear();
                      },
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: MyColors.appColorBlue2(),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: MyColors.appColorGrey100(),
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: MyColors.appColorGrey100(),
                        width: 2.0,
                      ),
                    ),
                    errorStyle: TextStyle(
                      color: MyColors.appColorRed(),
                      fontWeight: FontWeight.w500,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: MyColors.appColorGrey100(),
                        width: 2.0,
                      ),
                    ),
                    // focusedBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: MyColors.appColorBackC4()),
                    // ),
                  ),
                  validator: (value) {
                    if (value.toString().length < 4) {
                      return "parol uzunligi  4 birlik bo'lishi kerak";
                    } else {
                      return "";
                    }
                  },
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    // box.put("lockScreen", "1234");
                    setState((){});
                    print(box.get("lockScreen").toString());
                    if (!formKey.currentState!.validate()) {
                      !boolChangePassword
                          ? checkInputs(
                              textInputLock:
                                  textEditingController.text.toString().trim())
                          : {
                              box.delete("lockScreen"),
                              box.put("lockScreen",
                                  textEditingController.text.toString().trim()),
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            animType: AnimType.BOTTOMSLIDE,
                            title: "DTM",
                            body: Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    "saved".tr(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: MyColors.appColorBlack()),
                                  ),
                                  const SizedBox(height: 25),
                                ],
                              ),
                            ),
                            titleTextStyle: TextStyle(
                                color: MyColors.appColorBlue1(),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            descTextStyle: TextStyle(
                                color: MyColors.appColorBlack(),
                                fontWeight: FontWeight.bold),
                            btnCancelColor: MyColors.appColorBlue1(),
                            btnCancelText: "Ok",
                            btnCancelOnPress: () {
                              Navigator.of(context).pop();
                            }).show(),
                              boolChangePassword = false,
                            };
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: MyColors.appColorBlue2(),
                  height: 50,
                  minWidth: double.infinity,
                  child: MyWidgets.robotoFontText(
                      text: "access".tr(), textColor: MyColors.appColorWhite()),
                )
              ],
            ),
          )),
        )),
      ),
    );
  }
}
