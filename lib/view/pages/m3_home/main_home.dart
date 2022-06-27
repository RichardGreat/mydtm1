import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
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
    Future.delayed(Duration.zero);
    getServiceList();
    super.initState();
  }



  Future getServiceList() async {
    await providerMainHome.checkVersion(context: context);
    await providerMainHome.setLangUser();
    await providerMainHome.getDateService(context: context);
  }


  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }
  @override
  void dispose(){
    log("3333333333333333333333333333333");
    super.dispose();
  }
Future gerRefresh()async{
    setState((){});
}


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerMainHome,
      child: Consumer<ProviderMainHome>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          // appBar:   searchMain(context: context, providerMainHome: providerMainHome),
          body: RefreshIndicator(
            onRefresh:gerRefresh,
            child: SafeArea(
                child: bodyMainHome(
                    context: context, providerMainHome: providerMainHome)),
          ),
        ),
      ),
    );
  }
}
