import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/serch_main.dart';
import 'package:provider/provider.dart';

class CheckInfoCertificate extends StatefulWidget {
  const CheckInfoCertificate({super.key});

  @override
  State<CheckInfoCertificate> createState() => _CheckInfoCertificateState();
}

class _CheckInfoCertificateState extends State<CheckInfoCertificate> {
  @override
  void initState() {
    getServiceList();
    super.initState();
  }

  var box = Hive.box("online");

  Future getServiceList() async {
    Future.delayed(Duration.zero);
    await providerMainHome.getDateService(context: context);
  }

  ProviderMainHome providerMainHome = ProviderMainHome();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerMainHome,
      child: Consumer<ProviderMainHome>(
        builder: (context, value, child) => providerMainHome.boolParseData
            ? !providerMainHome.boolErrorHandle
                ? Scaffold(
                    appBar: searchMain(
                        context: context, providerMainHome: providerMainHome),
                    body: SafeArea(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              mainSearchBottomSheet(
                                  context: context,
                                  providerMainHome: providerMainHome);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "searchService".tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                  )
                : const Scaffold(
                    body: Center(child: CupertinoActivityIndicator()),
                  )
            : const Scaffold(
                body: Center(child: CupertinoActivityIndicator()),
              ),
      ),
    );
  }
}
