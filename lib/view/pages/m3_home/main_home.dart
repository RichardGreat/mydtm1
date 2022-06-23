import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/body_main_home.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
class MainHome extends StatefulWidget {

  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  ProviderMainHome providerMainHome = ProviderMainHome();

  @override
  void initState() {
    getServiceList();
    super.initState();
  }

  Future getServiceList() async {
    await providerMainHome.setLangUser();
    await providerMainHome.getDateService(context: context);
  }


  @override
  void didChangeDependencies(){
    log("3333333333333333333333333333333");
    super.didChangeDependencies();
  }
  @override
  void dispose(){
    log("3333333333333333333333333333333");
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerMainHome,
      child: Consumer<ProviderMainHome>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          // appBar:   searchMain(context: context, providerMainHome: providerMainHome),
          body: SafeArea(
              child: bodyMainHome(
                  context: context, providerMainHome: providerMainHome)),
        ),
      ),
    );
  }
}
