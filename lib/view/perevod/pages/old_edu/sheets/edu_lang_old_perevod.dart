// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

modelSheetEduLangOldPerevod(
    {required BuildContext contexts, required ProviderOldEdu providerOldEdu}) {
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: contexts,
      builder: (_) {
        return SizedBox(
            height: MediaQuery.of(contexts).size.height * 0.5,
            child: GetEduLangOldPerevod(providerOldEdu: providerOldEdu));
      });
}

class GetEduLangOldPerevod extends StatefulWidget {
  ProviderOldEdu providerOldEdu;

  GetEduLangOldPerevod({super.key, required this.providerOldEdu});

  @override
  State<GetEduLangOldPerevod> createState() => _GetEduLangOldPerevodState();
}

class _GetEduLangOldPerevodState extends State<GetEduLangOldPerevod> {
  @override
  initState() {
    getForeignCountry();
    super.initState();
  }

  Future getForeignCountry() async {
    await widget.providerOldEdu.getEduLang();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: widget.providerOldEdu.boolEduLang
          ? Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  MyWidgets.robotoFontText(text: "chooseLangEmode".tr(), textSize: 20),
                  const SizedBox(height: 10),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       margin: const EdgeInsets.all(10),
                  //       height: 50,
                  //       width: MediaQuery.of(context).size.width * 0.6,
                  //       child: TextFormField(
                  //         controller:
                  //         widget. providerOldEdu.textControllerCountryPerevod,
                  //         maxLines: 1,
                  //         keyboardType: TextInputType.text,
                  //         onChanged: (values) {
                  //
                  //           widget. providerOldEdu.searchCountryPerevod(values: values.toString());
                  //           setState(() {});
                  //         },
                  //         decoration: InputDecoration(
                  //           prefixIcon: const Icon(Icons.search),
                  //           counter: const SizedBox.shrink(),
                  //           contentPadding:
                  //           const EdgeInsets.only(left: 8, right: 8),
                  //           fillColor: Colors.white,
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(8),
                  //             borderSide: BorderSide(
                  //               color: MyColors.appColorBlue1(),
                  //             ),
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(8),
                  //             borderSide: BorderSide(
                  //               color: MyColors.appColorGrey400(),
                  //               width: 1.5,
                  //             ),
                  //           ),
                  //           focusedErrorBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(8),
                  //             borderSide: BorderSide(
                  //               color: MyColors.appColorBlue1(),
                  //               width: 1.5,
                  //             ),
                  //           ),
                  //           errorStyle: TextStyle(
                  //             color: MyColors.appColorRed(),
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //           errorBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(8),
                  //             borderSide: BorderSide(
                  //               color: MyColors.appColorBlue1(),
                  //               width: 1.5,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     IconButton(
                  //       onPressed: () {
                  //         widget.   providerOldEdu.closeWindowPerevod(context: context);
                  //       },
                  //       icon: Icon(CupertinoIcons.chevron_down,
                  //           color: MyColors.appColorBlack()),
                  //     )
                  //     // GestureDetector(child: Padding(
                  //     //   padding: const EdgeInsets.only(right: 10),
                  //     //   child: Icon(CupertinoIcons.chevron_down, color: MyColors.appColorBlack()),
                  //     // ),)
                  //   ],
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.providerOldEdu.listDataLangOld.length,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: MyWidgets.robotoFontText(
                              text: widget
                                  .providerOldEdu.listDataLangOld[index].name,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {});
                          widget.providerOldEdu.setEduLangOld(
                              name: widget
                                  .providerOldEdu.listDataLangOld[index].name
                                  .toString(),
                              id: widget
                                  .providerOldEdu.listDataLangOld[index].langId
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
