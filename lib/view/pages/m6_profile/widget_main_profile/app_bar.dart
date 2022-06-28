import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/screen_lock/screen_lock_window.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

PreferredSizeWidget appBarProfile(
    {required BuildContext context, required ProviderProfile providerProfile}) {
  var box = Hive.box("online");

  String getTextDialog() {
    return box.get("lockScreen").toString().length == 4 &&
            box.get("lockScreen").toString() != "null"
        ? "Dasturga kirish parolini o'chirish yoki boshqa qoyish"
        : "Parol qoymoqchimisiz";
  }

  return AppBar(
    backgroundColor: MyColors.appColorWhite(),
    elevation: 0,
    title: box.get("token").toString().length > 30
        ? MyWidgets.robotoFontText(text: "personalInfo".tr(), textSize: 24)
        : Text(""),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: GestureDetector(
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.NO_HEADER,
                animType: AnimType.BOTTOMSLIDE,
                title: "DTM",
                body: Container(
                  margin: EdgeInsets.all(15),
                  child: Column(children: [
                    Text(
                      getTextDialog(),
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 25),
                    box.get("lockScreen").toString().length == 4 &&
                            box.get("lockScreen").toString().trim() != "null"
                        ? Row(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  pushNewScreen(context,
                                      screen: ScreenLockWindow(
                                          idScreenLockWindow: "1"),
                                      withNavBar: false);
                                },
                                height: 45,
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.2,
                                color: MyColors.appColorBlue1(),
                                child: const Text("Parol almashtirish",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              const SizedBox(width: 5),
                              MaterialButton(
                                height: 45,
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.2,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  pushNewScreen(context,
                                      screen: ScreenLockWindow(
                                          idScreenLockWindow: "2"),
                                      withNavBar: false);
                                },
                                child: Text("Parolni o'chirish",
                                    style: TextStyle(color: Colors.black)),
                                color: MyColors.appColorWhite(),
                              ),
                            ],
                          )
                        : MaterialButton(
                            height: 45,
                            minWidth: MediaQuery.of(context).size.width * 0.4,
                            color: MyColors.appColorBlue1(),
                            child: Text("Yangi parol kiritish",
                                style:
                                    TextStyle(color: MyColors.appColorWhite())),
                            onPressed: () {
                              Navigator.of(context).pop();
                              pushNewScreen(context,
                                  screen:
                                      ScreenLockWindow(idScreenLockWindow: "0"),
                                  withNavBar: false);
                            },
                          )
                  ]),
                ),
                titleTextStyle: TextStyle(
                    color: MyColors.appColorBlue1(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                descTextStyle: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.bold),
              ).show();
            },
            child: Icon(
                box.get("lockScreen").toString().length == 4 &&
                        box.get("lockScreen").toString().trim() != "null"
                    ? Icons.lock
                    : Icons.lock_open_sharp,
                color: Colors.blue)),
      )
    ],
  );
}
