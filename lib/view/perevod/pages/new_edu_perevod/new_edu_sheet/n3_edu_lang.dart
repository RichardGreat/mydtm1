// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

modelSheetEduLangPerevod(
    {required BuildContext contexts,
    required ProviderNewEduPerevod providerNewEduPerevod}) {
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: contexts,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(contexts).size.height * 0.6,
            child: GetEduLangPerevod(
                providerNewEduPerevod: providerNewEduPerevod));
      });
}

class GetEduLangPerevod extends StatefulWidget {
  ProviderNewEduPerevod providerNewEduPerevod;

  GetEduLangPerevod({Key? key, required this.providerNewEduPerevod})
      : super(key: key);

  @override
  State<GetEduLangPerevod> createState() => _GetEduLangPerevodState();
}

class _GetEduLangPerevodState extends State<GetEduLangPerevod> {
  @override
  initState() {
    getEduLang();
    super.initState();
  }

  Future getEduLang() async {
    await widget.providerNewEduPerevod.getEduLangPerevod();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: widget.providerNewEduPerevod.boolEduLang
          ? Container(
              height: MediaQuery.of(context).size.height * 0.6,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MyWidgets.robotoFontText(
                      text: "chooseLangEmode".tr(),
                      textColor: MyColors.appColorBBA(),
                      textSize: 18
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          widget.providerNewEduPerevod.listDataLang.length,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: MyWidgets.robotoFontText(
                              text: widget.providerNewEduPerevod
                                  .listDataLang[index].name,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {});
                          widget.providerNewEduPerevod.setLangEdu(
                              langName: widget.providerNewEduPerevod
                                  .listDataLang[index].name
                                  .toString(),
                              langId: widget.providerNewEduPerevod
                                  .listDataLang[index].langId
                                  .toString()
                                  .toString());

                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ))
          : Center(child: MyWidgets.loaderDownload(context: context)),
    );
  }
}
