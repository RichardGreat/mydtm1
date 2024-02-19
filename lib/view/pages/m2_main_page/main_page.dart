// ignore_for_file: must_be_immutable
import 'dart:developer';
import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mydtm/main.dart';
import 'package:mydtm/view/pages/check_certificate/check_cert/check_cert.dart';
import 'package:mydtm/view/pages/check_certificate/check_sertificats.dart';
import 'package:mydtm/view/pages/m2_book_question/book_questions.dart';
import 'package:mydtm/view/pages/m3_home/main_home.dart';
import 'package:mydtm/view/pages/m4_arizalar/main_my_statement.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:ntp/ntp.dart';

class MainPages extends StatefulWidget {
  String homeIdMainpage;

  MainPages({super.key, required this.homeIdMainpage});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  Future getBoshFunc() async {
    // await widget.providerCheckInformation.getQaydVaraqa2();
    setState(() {});
  }

  int index = 0;

  // GlobalKey<NavigatorState> navigatorKey0012 = GlobalKey<NavigatorState>();
  ///
  dynamic selected;
  var heart = false;

  var box = Hive.box("online");

  Future getFirstAction() async {
    try {
      await Future.delayed(Duration.zero);
      box.delete("updateVersion");
      box.put("updateVersion", "1005");
    } catch (e) {
      throw Exception("Error update");
    }
  }

  @override
  initState() {
    super.initState();

    screenLock123();
    // isBiometricAvailable();
    getFirstAction();
  }

  timerM() async {
    DateTime myTime;
    myTime = await NTP.now();
    List<int> monthDayCount = [
      0,
      31,
      29,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    // box.put("faceIdDateMonth", "11");
    // box.put("faceIdDateDay", "27");
    // box.put("faceId", "1");
    // log("faceIdDateMonth :: ${box.get("faceIdDateMonth")}");
    // log("faceIdDateDay :: ${box.get("faceIdDateDay")}");
    int month = int.parse(box.get("faceIdDateMonth") ?? "12".toString());
    int day = int.parse(box.get("faceIdDateDay") ?? "1".toString());


    box.get("faceId").toString() == "1"
        ? {
            if (myTime.month - month == 0)
              {
                if (myTime.day - day <= 30)
                  {
                    box.put("faceIdQolganKun",
                        (30 - (myTime.day - day).abs()).toString())
                  }
                else
                  {
                    box.put("faceId", "0"),
                    box.put("faceIdDateMonth", "0"),
                    box.put("faceIdDateDay", "0"),
                    box.put("faceIdQolganKun", "0")
                  }
              }
            else if (myTime.month - month == 1)
              {
                if (monthDayCount[month] -
                        myTime.day -
                        (monthDayCount[month] - day) >
                    0)
                  {
                    box.put("faceId", "1"),
                    // box.put("faceIdDateMonth", "0"),
                    // box.put("faceIdDateDay", "0"),
                    box.put(
                        "faceIdQolganKun",
                        (monthDayCount[month] -
                                myTime.day -
                                (monthDayCount[month] - day))
                            .toString())
                  }
                else
                  {
                    box.put("faceId", "0"),
                    box.put("faceIdDateMonth", "0"),
                    box.put("faceIdDateDay", "0"),
                    box.put("faceIdQolganKun", "0")
                  }
              }
            else
              {
                box.put("faceId", "0"),
                box.put("faceIdDateMonth", "0"),
                box.put("faceIdDateDay", "0"),
                box.put("faceIdQolganKun", "0")
              }

            // else{
            //   box.put("faceId", "0"),
            //   box.put("faceIdDateMonth", "0"),
            //   box.put("faceIdDateDay", "0"),
            //   box.put("faceIdQolganKun", "0")
            // }
          }
        : {log("bo'sh")};
  }
  //
  // Future<void> localAuth(BuildContext context) async {
  //   final localAuth = LocalAuthentication();
  //   final didAuthenticate = await localAuth.authenticate(
  //       localizedReason: 'Please authenticate',
  //
  //   );
  //
  //   if (didAuthenticate) {
  //     Navigator.pop(context);
  //   }
  // }

  Future<void> authenticate() async {
    final localAuth = LocalAuthentication();

    try {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      List<BiometricType> availableBiometrics = await localAuth.getAvailableBiometrics();

      if (canCheckBiometrics && availableBiometrics.contains(BiometricType.face)) {
        bool isAuthenticated = await localAuth.authenticate(
          localizedReason: 'Authenticate with Face ID',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: false,
            sensitiveTransaction: true,
            biometricOnly: false,
          ),
        );

        if (isAuthenticated) {
          print('User authenticated successfully with Face ID');
          Navigator.pop(context);
        } else {
          print('User could not be authenticated with Face ID');
        }
      } else {
        print('Face ID is not available on this device');
      }
    } catch (e) {
      print('Error during Face ID authentication: $e');
    }
  }

  // screenLock(
  // context: context,
  // correctString: '1234',
  // customizedButtonChild: Icon(Icons.fingerprint),
  // customizedButtonTap: () async => await localAuth(context),
  // didOpened: () async => await localAuth(context),
  // );


  Future screenLock123() async {
    timerM();
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    await Future.delayed(const Duration(milliseconds: 10)).then((value) {
      if (box.get("langLock").toString().trim() == "1") {
        box.delete("langLock");
      } else {
        box.get("lockScreen").toString().trim().length == 4 &&
                box.get("lockScreen").toString() != "null"
            ? {
                screenLock(
                  useBlur: true,

                  context: navigatorKey.currentContext!,
                  correctString: box.get("lockScreen").toString(),
                  canCancel: false,
                  footer: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.noHeader,
                              animType: AnimType.bottomSlide,
                              title: "BBA",
                              desc: "logUot".tr(),
                              titleTextStyle: TextStyle(
                                  color: MyColors.appColorBlue1(),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              descTextStyle: TextStyle(
                                  color: MyColors.appColorBlack(),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              btnOkOnPress: () {
                                box.delete("token");
                                box.delete("imie");
                                box.delete("psnum");
                                box.delete("personImage");
                                box.delete("boxAllPersonInfo");
                                box.delete("langLock");
                                box.delete("lockScreen");

                                if (Platform.isIOS) {
                                  exit(0);
                                } else {
                                  SystemNavigator.pop();
                                }
                                Navigator.of(context).pop();
                              },
                              btnOkText: "yes".tr(),
                              btnOkColor: MyColors.appColorGrey600(),
                              btnCancelColor: MyColors.appColorBBA(),
                              btnCancelOnPress: () {},
                              btnCancelText: "no".tr(),
                            ).show();
                          },
                          child: Text("exet".tr())),
                      const SizedBox(width: 20),
                    ],
                  ),
                  title: Text("pinPassword".tr()),
                  customizedButtonChild: const Icon(
                    Icons.fingerprint,
                  ),
                  customizedButtonTap: () async => await authenticate(),
                  config: const ScreenLockConfig(
                    backgroundColor: Colors.black,
                  ),
                  // customizedButtonTap: () async => await localAuth(context),
                  // didOpened: () async => await localAuth(context),
                ),
                box.delete("lockHasEnter")
              }
            : {};
      }
    });
  }

  int currentIndex = 0;
  final List<IconData> icons = [
    Icons.my_library_books_rounded,
    Icons.book,
    Icons.manage_search_rounded,
    Icons.library_add_check,
  ];

  int animationWindowValue = 1;

  /// widget list
  final List<Widget> bottomBarPages = [
    MainMyStatement(numberParam: "0"),
    const BookQuestions(),
    const CheckInfoCertificate(),
    CheckCertificate(actionAnimationValue: 1),
    MainHome(homePageId: "0"),
  ];
  int _bottomNavIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:
            Color.lerp(Colors.teal.withOpacity(0.9), Colors.teal, 1),
        elevation: 0,
        toolbarHeight: 1,
      ),
      // drawer: Drawer(),
      body: Container(child: bottomBarPages[_bottomNavIndex]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.home,
            color: _bottomNavIndex == 4 ? Colors.teal : Colors.grey),
        onPressed: () {
          if (index >= 1) {
            box.put("animationWindowValue", 0.6);
          } else {
            box.put("animationWindowValue", -0.6);
          }
          _bottomNavIndex = 4;
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.white,
        splashColor: Colors.white,
        borderColor: Colors.white,
        icons: icons,
        activeColor: Colors.teal,
        shadow: const Shadow(
            color: Colors.white,
            offset: Offset(
              0,
              0,
            ),
            blurRadius: 0),
        elevation: 0,
        activeIndex: _bottomNavIndex,
        inactiveColor: Colors.grey,
        iconSize: 30,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() {
          log(index.toString());
          if (_bottomNavIndex != 4) {
            if (_bottomNavIndex > index) {
              box.put("animationWindowValue", 0.7);
            } else {
              box.put("animationWindowValue", -0.7);
            }
          } else {
            if (index > 1) {
              box.put("animationWindowValue", 0.7);
            } else {
              box.put("animationWindowValue", -0.7);
            }
          }

          _bottomNavIndex = index;
        }),
      ),
    );
  }
}
