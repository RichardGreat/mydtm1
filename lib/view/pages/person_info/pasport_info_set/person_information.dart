import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/buttons_person.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/input_pasport.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class PersonInformation extends StatefulWidget {
  const PersonInformation({Key? key}) : super(key: key);

  @override
  State<PersonInformation> createState() => _PersonInformationState();
}

class _PersonInformationState extends State<PersonInformation> {
  ProviderPersonInfo providerPersonInfo = ProviderPersonInfo();

  @protected
  @mustCallSuper
  void initState() {
    providerPersonInfo.getPersonInformation(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerPersonInfo,
      child: Consumer<ProviderPersonInfo>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: MyColors.appColorWhite(),
            appBar: appBarPersonInfo(),
            body: Form(
                key: providerPersonInfo.formKey123,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: !providerPersonInfo.boolNetworkGetData
                    ? SafeArea(
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
                                MyWidgets.robotoFontText(text: "Millati"),
                                const SizedBox(height: 4),
                                Expanded(
                                    child: buttonsPersonInfo(
                                        context: context,
                                        providerPersonInfo: providerPersonInfo)),
                              ],
                            ),
                          ),
                        ))
                        : const Center(child: CupertinoActivityIndicator(),)
                )

            ),
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
