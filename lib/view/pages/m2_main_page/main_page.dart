import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        const MainProfile(),
      ];
  int index = 0;
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(

      context,
        screens: myPages(), items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: MyColors.appColorWhite(),
      controller: controller,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBar: false,
      hideNavigationBarWhenKeyboardShows: false,
      decoration: NavBarDecoration(
        borderRadius:const BorderRadius.only(topRight: Radius.circular(10), topLeft:Radius.circular(10)),
        colorBehindNavBar:MyColors.appColorBlue1(),
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
    // PersistentBottomNavBarItem(
    //   icon: const Icon(Icons.group, size: 36,),
    //   inactiveIcon: const Icon(Icons.group_outlined,  size: 36,),
    //   // title: ("Home"),
    //   activeColorPrimary: MyColors.appColorBlue1(),
    //   activeColorSecondary:MyColors.appColorBlue1(),
    //   inactiveColorPrimary:MyColors.appColorGrey400(),
    //
    // ),

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
