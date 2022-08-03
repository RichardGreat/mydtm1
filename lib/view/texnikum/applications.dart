import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ApplicationTexnikum extends StatefulWidget {
  ProviderTexnikum providerTexnikum;

  ApplicationTexnikum({Key? key, required this.providerTexnikum})
      : super(key: key);

  @override
  State<ApplicationTexnikum> createState() => _ApplicationTexnikumState();
}

class _ApplicationTexnikumState extends State<ApplicationTexnikum> {
  @override
  initState() {

    getData();
    super.initState();
  }

  Future getData()async{
    await widget.providerTexnikum.getAllData();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.providerTexnikum.boolQaydVaraqaGet
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyWidgets.robotoFontText(text: "aboutApplication".tr()),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.appColorWhite(),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 1,
                            color: MyColors.appColorGrey400())
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                          title: Text("numberApplication".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.appColorBlack())),
                          onTap: () {},
                          trailing: Text(
                            widget.providerTexnikum.modelQaydVaraqaTexnikum.masseage.imie.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                        title: Text("applicent".tr()),
                        onTap: () {},
                        trailing: Text("1",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: MyColors.appColorBlack())),
                      ),
                      ListTile(
                          title: Text("holat".tr()),
                          onTap: () {},
                          trailing: Text(
                            " providerAriza.model.status == 1",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                      ListTile(
                        title: Text("lastChange".tr()),
                        onTap: () {},
                        trailing: Text(
                          widget.providerTexnikum.modelQaydVaraqaTexnikum.masseage.eduName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),

                      ListTile(
                        title: Text("testRegion".tr()),
                        onTap: () {},
                        trailing: Text(
                          widget.providerTexnikum.modelQaydVaraqaTexnikum.masseage.eduDirectionName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),

                      // MyWidgets.robotoFontText(text: "Oliy ta'lim muassasalariga qabul"),
                      // MyWidgets.robotoFontText(text: providerAriza.model.imie.toString()),
                      // MyWidgets.robotoFontText(text: providerAriza.model.invoice.toString()),
                      // MyWidgets.robotoFontText(text: providerAriza.model.status.toString()),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}
