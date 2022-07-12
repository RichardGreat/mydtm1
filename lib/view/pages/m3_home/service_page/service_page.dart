import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m3_home/service_page/app_bar_service.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/pages/m3_home/service_page/widgets/service_page_body.dart';
import 'package:mydtm/view/pages/m3_home/service_page/widgets/service_page_head.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class ServicePage extends StatefulWidget {
  late ServiceMainList serviceMainList;

  ServicePage(
      {Key? key,
      required this.serviceMainList,
    })
      : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  ProviderServicePage providerServicePage = ProviderServicePage();

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
                      context: context,
                      providerServicePage: providerServicePage,
                  serviceMainList: widget.serviceMainList
                  ),
                  const SizedBox(height: 20),
                  servicePageBody(
                    serviceMainList: widget.serviceMainList,
                      context: context, providerServicePage: providerServicePage)
                ],
              ),
            )),
      ),
    );
  }
}
