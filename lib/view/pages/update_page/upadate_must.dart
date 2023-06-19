import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateMust extends StatefulWidget {
  const UpdateMust({Key? key}) : super(key: key);

  @override
  State<UpdateMust> createState() => _UpdateMustState();
}

class _UpdateMustState extends State<UpdateMust> {
  var box = Hive.box("online");

  @override
  initState() {
    Future.delayed(Duration.zero);
    box.put("updateMust", "3");
    super.initState();
  }

  final Uri _url =
      Uri.parse('https://play.google.com/store/apps/details?id=www.uzbmba.uz');

  Future openGooglePlayMarket() async {
    try {
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  final Uri _urlIphone = Uri.parse(
      'https://apps.apple.com/uz/app/bilim-va-malakalarni-baholash/id6447829367');

  Future openAppsStore() async {
    try {
      if (!await launchUrl(_urlIphone)) throw 'Could not launch $_urlIphone';
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("BMBA",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(height: 25),
                Center(
                    child: GestureDetector(
                        onTap: () {
                          if (Platform.isIOS) {
                            openAppsStore();
                          } else {
                            openGooglePlayMarket();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue.shade100,
                                    blurRadius: 5,
                                    spreadRadius: 0.1,
                                    offset: const Offset(0.1, 0.1))
                              ]),
                          child: Text(
                            textAlign: TextAlign.center,
                            box.get("updateMobileText").toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ))),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          if (Platform.isIOS) {
            exit(0);
          } else {
            SystemNavigator.pop();
          }
          return true;
        });
  }
}
