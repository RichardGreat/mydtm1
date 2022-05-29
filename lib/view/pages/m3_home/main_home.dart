import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/body_main_home.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/serch_main.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  ProviderMainHome providerMainHome = ProviderMainHome();
  @override
  void initState() {
    providerMainHome.getDateService();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => providerMainHome,
    child: Consumer<ProviderMainHome>(builder: (context, value, child) => Scaffold(
      backgroundColor: MyColors.appColorWhite(),
          appBar:   searchMain(context: context, providerMainHome: providerMainHome),
          body: SafeArea(
              child: bodyMainHome(
                  context: context, providerMainHome: providerMainHome)),
        ),),
    );
  }
}
