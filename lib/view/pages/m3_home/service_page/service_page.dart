// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m3_home/service_page/app_bar_service.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/pages/m3_home/service_page/widgets/service_page_body.dart';
import 'package:mydtm/view/pages/m3_home/service_page/widgets/service_page_head.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class ServicePage extends StatefulWidget {
  late ServiceMainList serviceMainList;

  ServicePage({
    super.key,
    required this.serviceMainList,
  });

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  ProviderServicePage providerServicePage = ProviderServicePage();

  @override
  void initState() {
    super.initState();
    // showCaseServicePage();
  }

  var box = Hive.box("online");

  // final GlobalKey oneServicePageGlobalKey = GlobalKey();
  // final GlobalKey twoServicePageGlobalKey = GlobalKey();
  // final GlobalKey threeServicePageGlobalKey = GlobalKey();

  // Future showCaseServicePage() async {
  //   try {
  //     box.get("token").toString().length > 30
  //         ? {
  //             if (box.get("showCaseServicePage").toString() != "1")
  //               {
  //                 WidgetsBinding.instance.addPostFrameCallback((_) {
  //                   ShowCaseWidget.of(context).startShowCase([
  //                     oneServicePageGlobalKey,
  //                     twoServicePageGlobalKey,
  //                     threeServicePageGlobalKey
  //                   ]);
  //                 })
  //               },
  //             box.put("showCaseServicePage", "1"),
  //           }
  //         : {};
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerServicePage,
      child: Consumer<ProviderServicePage>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: MyColors.appColorGrey100(),
            appBar: appBarService(context: context),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  servicePageHead(
                      // oneServicePageGlobal: oneServicePageGlobalKey,
                      context: context,
                      providerServicePage: providerServicePage,
                      serviceMainList: widget.serviceMainList),
                  const SizedBox(height: 20),
                  servicePageBody(
                      // twoServicePageGlobalKey: twoServicePageGlobalKey,
                      // threeServicePageGlobalKey: threeServicePageGlobalKey,
                      serviceMainList: widget.serviceMainList,
                      context: context,
                      providerServicePage: providerServicePage)
                ],
              ),
            )),
      ),
    );
  }
}
