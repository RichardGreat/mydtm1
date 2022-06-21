import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/buttons_person.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/input_pasport.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_received/person_received2.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class PersonInformation extends StatefulWidget {
  Function funcState;
  PersonInformation({Key? key, required this.funcState}) : super(key: key);

  @override
  State<PersonInformation> createState() => _PersonInformationState();
}

class _PersonInformationState extends State<PersonInformation> {
  ProviderPersonInfo providerPersonInfo = ProviderPersonInfo();

  @override
  void initState() {
    getPersonInfo();
    super.initState();
  }

  Future getPersonInfo()async{
    await providerPersonInfo.getPersonInformation(context: context);

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerPersonInfo,
      child: Consumer<ProviderPersonInfo>(
        builder: (context, value, child) => WillPopScope(child: Scaffold(
            backgroundColor: MyColors.appColorWhite(),
            appBar: appBarPersonInfo(),
            body:
            !providerPersonInfo.boolNetworkGetData
                ?
            ! providerPersonInfo.boolCheckImieHas?
            personReceived2(providerPersonInfo: providerPersonInfo, context: context)
                :
            Form(
                key: providerPersonInfo.formKey123,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child:  SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.95 -
                            appBarPersonInfo().preferredSize.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            inputPassportInfo(
                                context: context,
                                providerPersonInfo: providerPersonInfo),
                            const SizedBox(height: 10),
                            MyWidgets.robotoFontText(text: "nation".tr()),
                            const SizedBox(height: 4),
                            Expanded(
                                child: buttonsPersonInfo(
                                    context: context,
                                    providerPersonInfo: providerPersonInfo)),
                          ],
                        ),
                      ),
                    ))

            ): const Center(child: CupertinoActivityIndicator(),)

        ), onWillPop: ()async{
          Navigator.of(context).pop();
          widget.funcState();
          return true;
        })
        ,
      ),
    );
  }

  PreferredSizeWidget appBarPersonInfo(){
    return AppBar(
      toolbarHeight: 45,
      backgroundColor: MyColors.appColorWhite(),
      elevation: 0,
      iconTheme: IconThemeData(
          color: MyColors.appColorBlack()
      ),
    );
  }
}
