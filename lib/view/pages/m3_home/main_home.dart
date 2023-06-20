// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/body_main_home.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
class MainHome extends StatefulWidget {
  String homePageId = "";

   MainHome({Key? key, required this.homePageId}) : super(key: key);

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

  var box = Hive.box("online");


  Future getServiceList() async {
    Future.delayed(Duration.zero);
    //
    if(widget.homePageId == "1"){
      await providerMainHome.setLangUser();
      await providerMainHome.getDateService(context: context);
    }
    await providerMainHome.checkVersion(context: context);

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
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh:gerRefresh,
              child: bodyMainHome(context: context, providerMainHome: providerMainHome),
            ),
          ),
        ),
      ),
    );
  }
}
