import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/widgets/app_bar_check_info.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/widgets/body_check_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class CheckInformation extends StatefulWidget {
  String serviceName;

  CheckInformation({Key? key, required this.serviceName}) : super(key: key);

  @override
  State<CheckInformation> createState() => _CheckInformationState();
}

class _CheckInformationState extends State<CheckInformation> {
  ProviderCheckInformation providerCheckInformation =
      ProviderCheckInformation();

  @override
  initState(){
    // https://api.dtm.uz/v1/imtiyoz/check-data?imie=30309975270036
    providerCheckInformation.getInfoUser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCheckInformation,
      child: Consumer<ProviderCheckInformation>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorGrey100(),
          appBar: appBarCheckInfo(context: context),
          body:
          providerCheckInformation.boolCheckUserInfo?
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: bodyCheckInformation(
                    context: context,
                    providerCheckInformation: providerCheckInformation,
                    serviceName: widget.serviceName),
              ),
            ),
          ):MyWidgets.loaderDownload(context: context),
        ),
      ),
    );
  }
}
