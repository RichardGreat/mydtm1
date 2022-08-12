import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/privillage/provider_privillage_texnika.dart';
import 'package:mydtm/view/texnikum/privillage/sheet_choose_invalid.dart';
import 'package:mydtm/view/texnikum/privillage/widgets1/app_bar_privilege.dart';
import 'package:mydtm/view/texnikum/privillage/widgets1/body_no_privilege.dart';
import 'package:mydtm/view/texnikum/privillage/widgets1/body_privilege.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class PrivilegeTexnikum extends StatefulWidget {
  Function funcState;
  String windowId;

  PrivilegeTexnikum({Key? key, required this.funcState, required this.windowId}) : super(key: key);

  @override
  State<PrivilegeTexnikum> createState() => _PrivilegeTexnikumState();
}

class _PrivilegeTexnikumState extends State<PrivilegeTexnikum> {
  ProviderPrivilegeTexnikum providerPrivilegeTexnikum =
      ProviderPrivilegeTexnikum();

  @override
  initState() {
    getPrivellageTexnikum();
    super.initState();
  }

  Future getPrivellageTexnikum() async {
    await providerPrivilegeTexnikum.getPrivilegeTexnikum();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerPrivilegeTexnikum,
      child: Consumer<ProviderPrivilegeTexnikum>(
        builder: (context, value, child) => WillPopScope(
          onWillPop: () async {
            widget.windowId == "0"?Navigator.of(context).pop():{};
            return true;
          },
          child: Scaffold(
            backgroundColor: MyColors.appColorGrey100(),
            appBar: appBarPrivilegeTexnikum(
                context: context,
                providerPrivilegeTexnikum: providerPrivilegeTexnikum),
            body: providerPrivilegeTexnikum.boolGetDataPrivilege
                ? Column(
                    children: [
                      !providerPrivilegeTexnikum.boolAddInvalide
                          ? const SizedBox(height: 20)
                          : const SizedBox.shrink(),
                      !providerPrivilegeTexnikum.boolAddInvalide
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  color: MyColors.appColorWhite(),
                                  height: 50,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.9,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enableDrag: true,
                                      builder: (context) => Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            topLeft: Radius.circular(5),
                                          )),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          child: chooseInvalidType(
                                              context: context)),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add_circle,
                                          color: MyColors.appColorBlue1()),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text("addInvalid".tr())),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      !providerPrivilegeTexnikum.boolAddInvalide
                          ? const SizedBox(height: 30)
                          : const SizedBox.shrink(),
                      Expanded(
                          child: providerPrivilegeTexnikum.boolPrivilegeNot
                              ? bodyNoPrivilegeTexnikum(
                                  context: context,
                                  providerPrivilegeTexnikum:
                                      providerPrivilegeTexnikum)
                              : bodyPrivilegeTexnikum(
                                  context: context,
                                  providerPrivilegeTexnikum:
                                      providerPrivilegeTexnikum)),
                    ],
                  )
                : Center(
                    child: MyWidgets.loaderDownload(context: context),
                  ),
          ),
        ),
      ),
    );
  }
}
