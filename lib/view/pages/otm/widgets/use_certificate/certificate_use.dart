import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetCertificateUse({
  required BuildContext contexts,
  required ProviderChooseEdu providerChooseEdu,
}) {
  showModalBottomSheet(
      context: contexts,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return CertificateUseCheck(
          providerChooseEdu: providerChooseEdu,
          context: contexts,
        );
      });
}

class CertificateUseCheck extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;
  BuildContext context;

  CertificateUseCheck(
      {Key? key, required this.providerChooseEdu, required this.context})
      : super(key: key);

  @override
  State<CertificateUseCheck> createState() => _CertificateUseCheckState();
}

class _CertificateUseCheckState extends State<CertificateUseCheck> {
  int selectedRadio = 0;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.appColorWhite(),
        iconTheme: IconThemeData(color: MyColors.appColorBlack()),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: MyColors.appColorWhite()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount:
                      widget.providerChooseEdu.listCheckCertificate.length,
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
                          MyWidgets.robotoFontText(
                              text: "Milli sertifikatdan foydalanish"),
                          const SizedBox(height: 20),
                          Text(widget.providerChooseEdu
                                  .listCheckCertificate[index].name),
                          const Divider(),
                          Text(
                              "${widget.providerChooseEdu.listCheckCertificate[index].percent} %",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: MyColors.appColorBlack())),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: RadioListTile(
                                      title: Text("Foydalanish", style: TextStyle(fontSize: 14)),
                                      value: 1,
                                      groupValue: widget
                                          .providerChooseEdu
                                          .listCertificateCheckUse[index]
                                          .certId,
                                      onChanged: (val) {})),
                              Expanded(
                                  child: RadioListTile(
                                      title: Text("Rad etish", style: TextStyle(fontSize: 14)),
                                      value: 0,
                                      groupValue: widget
                                          .providerChooseEdu
                                          .listCertificateCheckUse[index]
                                          .certId,
                                      onChanged: (val) {
                                        {
                                          setSelectedRadio(
                                              int.parse(val.toString()));
                                        }
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: MyColors.appColorBlue1(),
                height: 50,
                minWidth: double.infinity,
                onPressed: () {},
                child:  Text("TASDIQLASH", style: TextStyle(color: MyColors.appColorWhite())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
