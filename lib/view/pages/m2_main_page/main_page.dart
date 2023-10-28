// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/main.dart';
import 'package:mydtm/view/pages/check_certificate/check_cert/check_cert.dart';
import 'package:mydtm/view/pages/check_certificate/check_sertificats.dart';
import 'package:mydtm/view/pages/m2_book_question/book_questions.dart';
import 'package:mydtm/view/pages/m3_home/main_home.dart';
import 'package:mydtm/view/pages/m4_arizalar/main_my_statement.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

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
        // ShowCaseWidget(
        //   builder: Builder(
        //     builder: (context) => MainHome(homePageId: widget.homeIdMainpage),
        //   ),
        // ),

        // ChooseEdu(funcState:getBoshFunc),
        MainMyStatement(numberParam: "0"),
        const BookQuestions(),
        MainHome(homePageId: widget.homeIdMainpage),
        const CheckInfoCertificate(),
        const CheckCertificate(),
        // MainProfile(myFunction: getFunction),
      ];
  int index = 0;

  // PersistentTabController controller = PersistentTabController(initialIndex: 2);

  ///
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

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
    listBool[3] = true;
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

  int currentIndex = 0;

  //
  // final List<String> title = [
  //   "",
  //   "",
  //   "",
  //   "",
  //   ""
  // ];

  final List<IconData> icons = [
    Icons.my_library_books_rounded,
    Icons.book,
    // Icons.home,
    Icons.manage_search_rounded,
    Icons.library_add_check,
  ];

  final List pages = [
    MainMyStatement(numberParam: "0"),
    const BookQuestions(),
    const CheckInfoCertificate(),
    const CheckCertificate(),
  ];

  void onItemTapped(int index) async {
    setState(() {
      currentIndex = index;
    });
  }

  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    MainMyStatement(numberParam: "0"),
    const BookQuestions(),
    const CheckInfoCertificate(),
    const CheckCertificate(),
    MainHome(homePageId: "0"),
  ];

  List<bool> listBool = [true, true, true, true, false];
  int _bottomNavIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,

      // extendBody: true,
      //to make floating action button notch transparent

      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   icons: icons,
      //   activeIndex: _bottomNavIndex,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.softEdge,
      //   leftCornerRadius: 32,
      //   rightCornerRadius: 32,
      //   onTap: (index) => setState(() => _bottomNavIndex = index),
      //   //other params
      // ),
      // bottomNavigationBar: StylishBottomBar(
      //   option: AnimatedBarOptions(
      //     // iconSize: 32,
      //     barAnimation: BarAnimation.fade,
      //     iconStyle: IconStyle.animated,
      //   ),
      //   items: [
      //     BottomBarItem(
      //       icon: const Icon(
      //         Icons.article,
      //       ),
      //       selectedIcon: const Icon(
      //         Icons.article
      //       ),
      //       // backgroundColor: Colors.teal,
      //       selectedColor: listBool[0]? Colors.teal:Colors.grey,
      //       unSelectedColor: Colors.grey,
      //       title: Text(""),
      //     ),
      //     BottomBarItem(
      //       icon: const Icon(Icons.article_outlined),
      //       selectedIcon: const Icon(Icons.article),
      //       selectedColor: listBool[1]? Colors.teal:Colors.grey,
      //       unSelectedColor: Colors.grey,
      //       // backgroundColor: Colors.orange,
      //       title: const Text(''),
      //     ),
      //     BottomBarItem(
      //         icon: const Icon(
      //           Icons.search,
      //         ),
      //         selectedIcon: const Icon(
      //           Icons.search_rounded,
      //         ),
      //         // backgroundColor: Colors.teal,
      //         selectedColor: listBool[2]? Colors.teal:Colors.grey,
      //         unSelectedColor: Colors.grey,
      //         title: const Text('')),
      //     BottomBarItem(
      //         icon: const Icon(
      //           Icons.library_add_check,
      //         ),
      //         selectedIcon: const Icon(
      //           Icons.library_add_check_outlined,
      //         ),
      //         // backgroundColor: Colors.white,
      //         selectedColor: listBool[3]? Colors.teal:Colors.grey,
      //         unSelectedColor: Colors.grey,
      //         title: const Text('')),
      //   ],
      //   hasNotch: true,
      //   fabLocation: StylishBarFabLocation.center,
      //   currentIndex: selected ?? 0,
      //   onTap: (index) {
      //     log(index.toString());
      //     controller.jumpToPage(index);
      //
      //     setState(() {
      //       selected = index;
      //       listBool[4] = false;
      //       for (int i = 0; i < 4; i++) {
      //         if (index == i) {
      //           listBool[index] = true;
      //         }  else {
      //           listBool[i] = false;
      //         }
      //       }
      //       log(listBool.toString());
      //     });
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //       log(listBool.toString());
      //       listBool[4] = true;
      //       for (int i = 0; i < 4; i++) {
      //         listBool[i] = false;
      //       }
      //       setState(() {
      //       });
      //
      //   },
      //   backgroundColor: Colors.white,
      //   child: Icon(
      //     listBool[4] ? Icons.home : Icons.home_outlined,
      //     color: listBool[4] ? Colors.teal : Colors.grey,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor:
            Color.lerp(Colors.teal.withOpacity(0.9), Colors.teal, 1),
        elevation: 0,
        toolbarHeight: 1,
      ),
      body: SafeArea(child: bottomBarPages[_bottomNavIndex]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.home,
            color: _bottomNavIndex == 4 ? Colors.teal : Colors.grey),
        onPressed: () {
          _bottomNavIndex = 4;
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        activeColor: Colors.teal,
        activeIndex: _bottomNavIndex,
        inactiveColor: Colors.grey,
        iconSize: 30,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
