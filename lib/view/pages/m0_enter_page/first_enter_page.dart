import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class EnterFirst0 extends StatefulWidget {
  const EnterFirst0({Key? key}) : super(key: key);

  @override
  State<EnterFirst0> createState() => _EnterFirst0State();
}

var box = Hive.box("online");

class _EnterFirst0State extends State<EnterFirst0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/gerb.png", height: 80, fit: BoxFit.cover),
                        const SizedBox(width: 10),
                        MyWidgets.robotoFontText(
                            text: "Davlat test markazi",
                            textColor: MyColors.appColorBlack(),
                            textSize: 28)
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        textColor: MyColors.appColorBlack(),
                        title: MyWidgets.robotoFontText(
                            text: "O'zbekcha", textFontWeight: FontWeight.w400),
                        leading: const CircleAvatar(
                          backgroundImage:
                          AssetImage("assets/images/uz.png"),
                          radius: 15,
                        ),
                        trailing: const Icon(CupertinoIcons.chevron_forward),
                        onTap: () {
                          box.delete("language");
                          box.put("language", "1");
                          context.locale = const Locale("uz", "UZ");
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const MainPages(),
                              ));
                        },
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        textColor: MyColors.appColorBlack(),
                        title: MyWidgets.robotoFontText(
                            text: "Qaraqalpaqsha", textFontWeight: FontWeight.w400),
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/kk.png"),
                          radius: 15,
                        ),
                        trailing: const Icon(CupertinoIcons.chevron_forward),
                        onTap: () {
                          box.delete("language");
                          box.put("language", "2");
                          context.locale = const Locale("kk", "KK");
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const MainPages(),
                              ));
                        },
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        textColor: MyColors.appColorBlack(),
                        title: MyWidgets.robotoFontText(
                            text: "Русский", textFontWeight: FontWeight.w400),
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/ru.png"),
                          radius: 15,
                        ),
                        trailing: const Icon(CupertinoIcons.chevron_forward),
                        onTap: () {
                          box.delete("language");
                          box.put("language", "3");
                          context.locale = const Locale("ru", "RU");
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const MainPages(),
                              ));
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}