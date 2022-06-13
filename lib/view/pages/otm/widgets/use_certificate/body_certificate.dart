import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyCertificateOTM(
    {required BuildContext context,
    required ProviderChooseEdu providerChooseEdu}) {
  return  StatefulBuilder(builder: (context, setState) =>  SafeArea(
    child: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: MyColors.appColorWhite()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(icon: Icon(Icons.arrow_back_outlined, color:MyColors.appColorBlack()), onPressed: () {  },),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: providerChooseEdu.listCertificateCheckUse.length,
              itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.appColorWhite(),
                      boxShadow: [
                        BoxShadow(
                            color: MyColors.appColorGrey400(),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ]),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      MyWidgets.robotoFontText(text: "useCertificate".tr()),
                      const SizedBox(height: 20),
                      Text(providerChooseEdu.listCheckCertificate[index].name),
                      const Divider(),
                      Text(
                          "${providerChooseEdu.listCheckCertificate[index].percent} %",
                          style: TextStyle(
                              fontSize: 20, color: MyColors.appColorBlack())),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: RadioListTile(
                                  title: Text("use".tr(),
                                      style: TextStyle(fontSize: 14)),
                                  value: 1,
                                  groupValue:int.parse(providerChooseEdu
                                      .listCertificateCheckUse[index].certId),
                                  onChanged: (val) {
                                    setState(() {});
                                    providerChooseEdu.setUserNationCert(
                                        indexId: index,
                                        certId: providerChooseEdu
                                            .listCertificateCheckUse[index]
                                            .certName,

                                        userVal: int.parse(val.toString()));
                                  })),
                          Expanded(
                              child: RadioListTile(
                                  title: Text("rejection".tr(),
                                      style: TextStyle(fontSize: 14)),
                                  value: 0,
                                  groupValue: int.parse(providerChooseEdu
                                      .listCertificateCheckUse[index].certId),
                                  onChanged: (val) {
                                    setState(() {});
                                    providerChooseEdu.setUserNationCert(
                                        indexId: index,
                                        certId: providerChooseEdu
                                            .listCertificateCheckUse[index]
                                            .certName,
                                        userVal: int.parse(val.toString()));
                                    // {
                                    //   setSelectedRadio(
                                    //       int.parse(val.toString()));
                                    // }
                                    // widget.providerChooseEdu
                                    //     .setUserNationCert(
                                    //         certId: widget
                                    //             .providerChooseEdu
                                    //             .listCheckCertificate[index]
                                    //             .certSernum
                                    //             .toString(),
                                    //         userVal: val.toString());
                                  })),
                        ],
                      )
                    ],
                  )),
            ),
          ),
          MaterialButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: MyColors.appColorBlue1(),
            height: 50,
            minWidth: double.infinity,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("access".tr(),
                style: TextStyle(color: MyColors.appColorWhite())),
          )
        ],
      ),
    ),
  ),);
}
