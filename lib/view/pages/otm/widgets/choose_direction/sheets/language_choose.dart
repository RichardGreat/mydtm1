// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

sheetLanguageChooseTest(
    {required BuildContext context,
    required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      enableDrag: true,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
            margin: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.6,
            child: LangEduChooseTest(providerChooseEdu: providerChooseEdu),
          ),
        );
      });
}

class LangEduChooseTest extends StatefulWidget {
  late ProviderChooseEdu providerChooseEdu;

  LangEduChooseTest({super.key, required this.providerChooseEdu});

  @override
  State<LangEduChooseTest> createState() => _LangEduChooseTestState();
}

class _LangEduChooseTestState extends State<LangEduChooseTest> {
  Future langEduChooseTest() async {
    // await Future.delayed(Duration(seconds: 1));
    await widget.providerChooseEdu.getLangEduChooseTest(
        context: context, providerChooseEdu: widget.providerChooseEdu);
    setState(() {});
  }

  @override
  initState() {
    langEduChooseTest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(


        child: widget.providerChooseEdu.boolLangEduTest
            ? Container(

                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyWidgets.robotoFontText(
                                text: "chooseLangEmode".tr(), textSize: 28),
                            IconButton(
                                onPressed: () {
                                  widget.providerChooseEdu
                                      .textLangEduChooseTestController
                                      .clear();
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(CupertinoIcons.chevron_down))
                          ]),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      child: TextFormField(
                        controller: widget
                            .providerChooseEdu.textLangEduChooseTestController,
                        minLines: 1,
                        onChanged: (value) {
                          widget.providerChooseEdu
                              .searchLangEduChooseTest(value: value);
                          setState(() {});
                        },
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffix: IconButton(
                              onPressed: () {
                                widget.providerChooseEdu
                                    .clearTextLangEduChoose();
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.clear,
                                size: 12,
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey400(),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey400(),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey400(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget
                            .providerChooseEdu.listLangEduChooseTestTemp.length,
                        itemBuilder: (context, index) => GestureDetector(
                          child: Card(
                            margin: const EdgeInsets.only(top: 4, bottom: 4),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                widget.providerChooseEdu
                                    .listLangEduChooseTestTemp[index].name,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                style: const TextStyle(color:Colors.black,
                                fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            widget.providerChooseEdu.setLanguage(
                                name: widget.providerChooseEdu
                                    .listLangEduChooseTestTemp[index].name,
                                id: widget.providerChooseEdu
                                    .listLangEduChooseTestTemp[index].id
                                    .toString());
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ))
            : MyWidgets.loaderDownload(context: context),
      ),
    );
  }
}
