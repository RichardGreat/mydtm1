import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/button_addres_info.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/pages/person_info/address_info/region_set_info/region_set_inputs.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class AddressInfo extends StatefulWidget {
  Function funcState;
  AddressInfo({Key? key, required this. funcState}) : super(key: key);

  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  ProviderAddressInfo providerAddressInfo = ProviderAddressInfo();
  @override
  initState(){
    providerAddressInfo.getAddressInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerAddressInfo,
      child: Consumer<ProviderAddressInfo>(
        builder: (context, value, child) =>
          WillPopScope(child:   Form(
            key: providerAddressInfo.keyAddressInfo,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child:
            Scaffold(
                backgroundColor: MyColors.appColorWhite(),
                appBar: addressAppBar(
                    context: context, providerAddressInfo: providerAddressInfo),
                body: providerAddressInfo.boolGetAddressInfo ?

                SafeArea(
                    child: Container(
                      margin: const EdgeInsets.all(10),
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
                            buttonAddressInfo(context: context, providerAddressInfo: providerAddressInfo)
                          ],
                        ),
                      ),
                    )):const Center(child: CupertinoActivityIndicator(),)
            ),
          ), onWillPop: ()async{
            await widget.funcState();
            Navigator.of(context).pop();

            return true;
          }),
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
