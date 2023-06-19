import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/main.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/buttons_person.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/input_pasport.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_received/person_received2.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PersonInformation extends StatefulWidget {
  Function funcState;
  String idFunction;
  String windowIdPassport = "0";

  PersonInformation(
      {Key? key, required this.funcState, required this.idFunction, required this.windowIdPassport})
      : super(key: key);

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

  Future getPersonInfo() async {
    await providerPersonInfo.getPersonInformation(context: context, function:    widget.funcState);
  }

  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerPersonInfo,
      child: Consumer<ProviderPersonInfo>(
        builder: (context, value, child) => WillPopScope(
          onWillPop: () async {


            if (widget.idFunction == "0") {
              Navigator.of(context).pop();
              widget.funcState();
              return true;
            } else if (widget.idFunction == "1" && box.get("imie").toString().length > 12) {
              Navigator.of(context).pop();

              return true;
            } else if (widget.idFunction == "99") {
              box.delete("langLock");
              box.put("langLock", "1");
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                  (route) => false);
            }
            return false;
          },
          child: Scaffold(
              backgroundColor: MyColors.appColorWhite(),

              appBar: appBarPersonInfo(),

              body: !providerPersonInfo.boolNetworkGetData
                  ? !providerPersonInfo.boolCheckImieHas
                      ? personReceived2(
                          providerPersonInfo: providerPersonInfo,
                          context: context)
                      : Form(
                          key: providerPersonInfo.formKey123,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: SafeArea(
                              child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height*0.85,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  inputPassportInfo(
                                      context: context,
                                      providerPersonInfo: providerPersonInfo),
                                  const SizedBox(height: 20),
                                  // MyWidgets.robotoFontText(text: "nation".tr()),
                                  // const SizedBox(height: 4),
                                  buttonsPersonInfo(
                                      context: context,
                                      providerPersonInfo:
                                          providerPersonInfo),
                                ],
                              ),
                            ),
                          )))
                  : const Center(
                      child: CupertinoActivityIndicator(),
                    )),
        ),
      ),
    );
  }

  PreferredSizeWidget appBarPersonInfo() {
    return AppBar(
      toolbarHeight: 45,
      backgroundColor: MyColors.appColorWhite(),
      elevation: 0,
      iconTheme: IconThemeData(color: MyColors.appColorBlack()),
    );
  }
}
