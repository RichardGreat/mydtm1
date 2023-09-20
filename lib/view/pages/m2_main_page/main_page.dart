// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/main.dart';
import 'package:mydtm/view/pages/check_certificate/check_cert/check_cert.dart';
import 'package:mydtm/view/pages/check_certificate/check_sertificats.dart';
import 'package:mydtm/view/pages/m3_home/main_home.dart';
import 'package:mydtm/view/pages/m4_arizalar/main_my_statement.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:showcaseview/showcaseview.dart';

class MainPages extends StatefulWidget {
  String homeIdMainpage;

  MainPages({Key? key, required this.homeIdMainpage}) : super(key: key);

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  Future getBoshFunc() async {
    // await widget.providerCheckInformation.getQaydVaraqa2();
    setState(() {});
  }

  List<Widget> myPages() => [
        ShowCaseWidget(
          builder: Builder(
            builder: (context) => MainHome(homePageId: widget.homeIdMainpage),
          ),
        ),


        // ChooseEdu(funcState:getBoshFunc),
        MainMyStatement(numberParam: "0"),
        const CheckInfoCertificate(),
        const CheckCertificate()
        // MainProfile(myFunction: getFunction),
      ];
  int index = 0;
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  getFunction() {
    setState(() {});
  }

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

  Future screenLock123() async {
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
                            // AwesomeDialog(
                            //         context: context,
                            //         dialogType: DialogType.noHeader,
                            //         animType: AnimType.bottomSlide,
                            //         title: "DTM",
                            //         desc: "logUot".tr(),
                            //         titleTextStyle: TextStyle(
                            //             color: MyColors.appColorBlue1(),
                            //             fontSize: 24,
                            //             fontWeight: FontWeight.bold),
                            //         descTextStyle: TextStyle(
                            //             color: MyColors.appColorBlack(),
                            //             fontWeight: FontWeight.bold),
                            //         btnCancelOnPress: () {
                            //           if (Platform.isIOS) {
                            //             exit(0);
                            //           } else {
                            //             SystemNavigator.pop();
                            //           }
                            //           Navigator.of(context).pop();
                            //           box.delete("lockScreen");
                            //           box.delete("token");
                            //           box.delete("imie");
                            //           box.delete("psnum");
                            //           box.delete("personImage");
                            //           box.delete("boxAllPersonInfo");
                            //         },
                            //         btnCancelColor: MyColors.appColorBlue1(),
                            //         btnCancelText: "OK")
                            //     .show();
                          },
                          child: Text("exet".tr())),
                      const SizedBox(width: 20),
                    ],
                  ),
                  // customizedButtonChild: const Icon(
                  //   Icons.fingerprint,
                  // ),
                  title: Text("pinPassword".tr()),
                  config: const ScreenLockConfig(
                    backgroundColor: Colors.black,
                  ),
                  // customizedButtonTap: () async {
                  //   await authenticate(context: context);
                  // },
                  // didOpened: () async {
                  //   await authenticate(context: context);
                  // },
                ),
                box.delete("lockHasEnter")
              }
            : {};
      }
    });
  }

  // final LocalAuthentication _auth = LocalAuthentication();
  //
  // Future<bool> hasEnrolledBiometrics() async {
  //   final List<BiometricType> availableBiometrics =
  //       await _auth.getAvailableBiometrics();
  //   if (availableBiometrics.isNotEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  //
  // Future<bool> authenticate({required BuildContext context}) async {
  //
  // try{final bool didAuthenticate = await _auth.authenticate(
  //     localizedReason: "fingerScanner".tr(),
  //     options: const AuthenticationOptions(biometricOnly: true));
  // if (didAuthenticate) {
  //   Navigator.pop(context);
  // }
  // return didAuthenticate;}catch(e){
  //   print(jsonEncode(e).toString());
  //   return false;
  // }
  //
  // }
  //
  // bool showBiometrics = false;
  // bool isAuthenticated = false;
  //
  // isBiometricAvailable() async {
  //   showBiometrics = await hasEnrolledBiometrics();
  // }

  @override
  Widget build(BuildContext context) {

    return PersistentTabView(

      context,
      screenTransitionAnimation:const ScreenTransitionAnimation(
        animateTabTransition: true,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear),
      screens: myPages(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: MyColors.appColorWhite(),
      controller: controller,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBar: false,
      hideNavigationBarWhenKeyboardShows: false,
      decoration: NavBarDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        colorBehindNavBar: MyColors.appColorBBA(),
      ),
      popAllScreensOnTapOfSelectedTab: true,

      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style6,

    );
  }
}

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.home,
        size: 36,
      ),
      inactiveIcon: const Icon(
        Icons.home_outlined,
        size: 36,
      ),
      // title: ("Home"),
      activeColorPrimary: MyColors.appColorBBA(),
      activeColorSecondary:MyColors.appColorBBA(),
      inactiveColorPrimary: MyColors.appColorGrey400(),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.article,
        size: 36,
      ),
      inactiveIcon: const Icon(
        Icons.article_outlined,
        size: 32,
      ),
      activeColorPrimary: MyColors.appColorBBA(),
      activeColorSecondary:  MyColors.appColorBBA(),
      inactiveColorPrimary: MyColors.appColorGrey400(),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.manage_search_sharp,
        size: 36,
      ),
      inactiveIcon: const Icon(
        Icons.manage_search_sharp,
        size: 32,
      ),
      activeColorPrimary:  MyColors.appColorBBA(),
      activeColorSecondary:  MyColors.appColorBBA(),
      inactiveColorPrimary: MyColors.appColorGrey400(),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.library_add_check,
        size: 36,
      ),
      inactiveIcon: const Icon(
        Icons.library_add_check,
        size: 32,
      ),
      // title: ("Settings"),
      activeColorPrimary: MyColors.appColorBBA(),
      activeColorSecondary:  MyColors.appColorBBA(),
      inactiveColorPrimary: MyColors.appColorGrey400(),
    ),
  ];
}
