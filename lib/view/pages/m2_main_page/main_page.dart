import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/main_home.dart';
import 'package:mydtm/view/pages/m4_arizalar/main_my_statement.dart';
import 'package:mydtm/view/pages/m5_xabarlar/main_messages.dart';
import 'package:mydtm/view/pages/m6_profile/main_profile.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainPages extends StatefulWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  List<Widget> myPages() => [
        const MainHome(),
        MainMyStatement(numberParam: "0"),
        const MainMessages(),
        MainProfile(myFunction: getFunction),
      ];
  int index = 0;
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  getFunction() {
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    screenLocks();
    getFirstAction();
  }

  var box = Hive.box("online");

  Future screenLocks() async {
    await Future.delayed(const Duration(milliseconds: 50)).then((value) {
      screenLock(
        context: context,
        title:
            Text("Parol kiriting", style: TextStyle(color: MyColors.appColorBlack())),
        didConfirmed: (String a) {
          Navigator.of(context).pop();
        },
        correctString: "1234",
        didUnlocked: () {
          Navigator.of(context).pop();
        },
        // didOpened: (){
        //   Navigator.of(context).pop();
        // },
        confirmation: true,
        footer: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "DTM",
                style: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.w500),
              )
            ]),
        canCancel: false,
        screenLockConfig: const ScreenLockConfig(
          backgroundColor: Colors.white,
        ),
        secretsConfig: SecretsConfig(
          spacing: 15, // or spacingRatio
          padding: const EdgeInsets.all(40),
          secretConfig: SecretConfig(
            borderColor: Colors.white,
            borderSize: 2.0,
            disabledColor: Colors.black,
            enabledColor: Colors.blue,
            height: 15,
            width: 15,
            build: (context, {required config, required enabled}) {
              return SizedBox(
                width: config.width,
                height: config.height,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: enabled ? config.enabledColor : config.disabledColor,
                    border: Border.all(
                      width: config.borderSize,
                      color: config.borderColor,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  width: config.width,
                  height: config.height,
                ),
              );
            },
          ),
        ),
        cancelButton: const Icon(Icons.close, color: Colors.black),
        deleteButton:
            const Icon(CupertinoIcons.delete_left_fill, color: Colors.black),
      );
    });
  }

  Future getFirstAction() async {
    try {
      await Future.delayed(Duration.zero);
      box.put("updateVersion", "1001");
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
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
        colorBehindNavBar: MyColors.appColorBlue1(),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style3,
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
      activeColorPrimary: MyColors.appColorBlue1(),
      activeColorSecondary: MyColors.appColorBlue1(),
      inactiveColorPrimary: MyColors.appColorGrey400(),
    ),
    PersistentBottomNavBarItem(
      // title: ("Settings"),

      icon: const Icon(
        Icons.article,
        size: 36,
      ),
      inactiveIcon: const Icon(
        Icons.article_outlined,
        size: 32,
      ),
//             activeIcon:  Icon(Icons.settings, size: 32,),
      activeColorPrimary: MyColors.appColorBlue1(),
      activeColorSecondary: MyColors.appColorBlue1(),
      inactiveColorPrimary: MyColors.appColorGrey400(),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        CupertinoIcons.bell_fill,
        size: 36,
      ),
      inactiveIcon: const Icon(
        CupertinoIcons.bell,
        size: 32,
      ),
      activeColorPrimary: MyColors.appColorBlue1(),
      activeColorSecondary: MyColors.appColorBlue1(),
      inactiveColorPrimary: MyColors.appColorGrey400(),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.account_circle,
        size: 36,
      ),
      inactiveIcon: const Icon(
        Icons.account_circle_outlined,
        size: 32,
      ),
      // title: ("Settings"),
      activeColorPrimary: MyColors.appColorBlue1(),
      activeColorSecondary: MyColors.appColorBlue1(),
      inactiveColorPrimary: MyColors.appColorGrey400(),
    ),
  ];
}
