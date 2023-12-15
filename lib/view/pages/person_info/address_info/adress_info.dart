// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/check_information_page.dart';
import 'package:mydtm/view/pages/person_info/address_info/button_addres_info.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/pages/person_info/address_info/region_set_info/region_set_inputs.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:showcaseview/showcaseview.dart';

class AddressInfo extends StatefulWidget {
  Function funcState;
  String addressWindowId = "0";

  AddressInfo(
      {super.key, required this.funcState, required this.addressWindowId});

  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  ProviderAddressInfo providerAddressInfo = ProviderAddressInfo();

  @override
  initState() {
    providerAddressInfo.getAddressInfo();
    super.initState();
  }

  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => providerAddressInfo,
        child: Consumer<ProviderAddressInfo>(
          builder: (context, value, child) => WillPopScope(
            onWillPop: () async {
              if (widget.addressWindowId == "0") {
                widget.funcState();
                Navigator.push(context, CupertinoPageRoute(builder: (context) => ShowCaseWidget(
                  builder: Builder(
                      builder: (context) => CheckInformation(
                          serviceName: box.get("categoryName").toString())),
                ),));
              } else if (widget.addressWindowId == "1") {
                Navigator.of(context).pop();
              } else if (widget.addressWindowId == "2") {
                Navigator.of(context).pop();
              }
              return true;
            },
            child: Form(
              key: providerAddressInfo.keyAddressInfo,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Scaffold(
                  backgroundColor: MyColors.appColorWhite(),
                  appBar: addressAppBar(
                      context: context,
                      providerAddressInfo: providerAddressInfo),
                  body: providerAddressInfo.boolGetAddressInfo
                      ? SafeArea(
                          child: Container(
                          margin: const EdgeInsets.all(10),
                          padding:  const EdgeInsets.all(8),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyWidgets.robotoFontText(
                                    text: "addressAlways".tr(),
                                    textColor: MyColors.appColorBlack(),
                                    textSize: 26),
                                const SizedBox(height: 5),
                                MyWidgets.robotoFontText(
                                    text: "fillAll".tr(),
                                    textColor: MyColors.appColorGrey400(),
                                    textSize: 16),
                                regionSetInput(
                                    context: context,
                                    providerAddressInfo: providerAddressInfo),
                                buttonAddressInfo(
                                    context: context,
                                    providerAddressInfo: providerAddressInfo,
                                    windowIds: widget.addressWindowId)
                              ],
                            ),
                          ),
                        ))
                      : const Center(
                          child: CupertinoActivityIndicator(),
                        )),
            ),
          ),
        ));
  }

  PreferredSizeWidget addressAppBar(
      {required BuildContext context,
      required ProviderAddressInfo providerAddressInfo}) {
    return AppBar(
      backgroundColor: MyColors.appColorWhite(),
      elevation: 0,
      iconTheme: IconThemeData(color: MyColors.appColorBlack()),
    );
  }
}
