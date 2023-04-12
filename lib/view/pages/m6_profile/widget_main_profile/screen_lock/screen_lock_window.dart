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
        ? "pin4Length".tr()
        : widget.idScreenLockWindow == "1"
            ? "changePin".tr()
            : "deletePin".tr();
  }

  checkInputs({required String textInputLock}) {
    widget.idScreenLockWindow == "0"
        ? {
            box.put("lockScreen", textEditingController.text.toString().trim()),
            AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                animType: AnimType.bottomSlide,
                title: "BMBA",
                body: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        "saved".tr(),
                        style: TextStyle(
                            fontSize: 20, color: MyColors.appColorBlack()),
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
        : widget.idScreenLockWindow == "1"
            ? {
                /// Parol almashtirish
                if (box.get("lockScreen").toString().trim() == textInputLock)
                  {
                    boolChangePassword = true,
                    textEditingController.clear(),
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.noHeader,
                            animType: AnimType.bottomSlide,
                            title: "BMBA",
                            body: Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    "newPassword".tr(),
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
                else
                  {
                    AwesomeDialog(
                            context: context,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.bottomSlide,
                            title: "BMBA",
                            body: Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    "invalidPassword".tr(),
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
                            dialogType: DialogType.noHeader,
                            animType: AnimType.bottomSlide,
                            title: "BMBA",
                            body: Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    "passwordErase".tr(),
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
                            dialogType: DialogType.noHeader,
                            animType: AnimType.bottomSlide,
                            title: "BMBA",
                            body: Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    "invalidPassword".tr(),
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
                Text(!boolChangePassword ? textBody() : "newPassword".tr(),
              textAlign: TextAlign.center
              ,
                    style: TextStyle(
                        color: MyColors.appColorBlack(),
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: textEditingController,
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'\d')),
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
                      return "pin4Length".tr();
                    } else {
                      return "";
                    }
                  },
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    // box.put("lockScreen", "1234");
                    setState(() {});
                      if(textEditingController.text.isNotEmpty) {
                      if (!formKey.currentState!.validate()) {
                        !boolChangePassword
                            ? checkInputs(
                                textInputLock: textEditingController.text
                                    .toString()
                                    .trim())
                            : {
                                box.delete("lockScreen"),
                                box.put(
                                    "lockScreen",
                                    textEditingController.text
                                        .toString()
                                        .trim()),
                                AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.noHeader,
                                    animType: AnimType.bottomSlide,
                                    title: "BMBA",
                                    body: Container(
                                      margin: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Text(
                                            "saved".tr(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color:
                                                    MyColors.appColorBlack()),
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
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: MyColors.appColorBlue1(),
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
