import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/lock_screen_all.dart';
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

class _MainPagesState extends State<MainPages> with WidgetsBindingObserver {
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:

        break;
      case AppLifecycleState.inactive:
        {
          // print(box.get("lockHasEnter").toString());
          // print(box.get("langLock").toString());

          if( box.get("lockHasEnter").toString() != "1"){

            if(box.get("langLock").toString().trim() == "1"){
              box.delete("langLock");
            }
            else{
              box.get("lockScreen").toString().trim().length == 4 &&
                  box.get("lockScreen").toString() != "null"
                  ? {pushNewScreen(context, screen: LockScreenAllWindow()),
                box.delete("lockHasEnter")
              }
                  : {};};
          }else{

          }

        }
        break;
      case AppLifecycleState.paused:
        // Handle this case
        break;
      case AppLifecycleState.detached:
        // TODO: Handle this case.
        break;
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // screenLocks();
    getFirstAction();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  var box = Hive.box("online");
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
