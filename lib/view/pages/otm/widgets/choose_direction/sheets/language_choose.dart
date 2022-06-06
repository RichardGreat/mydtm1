import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetLanguageChooseTest(
    {required BuildContext context,
    required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: LangEduChooseTest(providerChooseEdu: providerChooseEdu),
          ),
        );
      });
}

class LangEduChooseTest extends StatefulWidget {
  late ProviderChooseEdu providerChooseEdu;

  LangEduChooseTest({Key? key, required this.providerChooseEdu})
      : super(key: key);

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
    return Container(
      child: widget.providerChooseEdu.boolLangEduTest
          ? Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50,
                            child: TextFormField(
                              controller: widget.providerChooseEdu
                                  .textLangEduChooseTestController,
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
                          IconButton(
                              onPressed: () {
                                widget.providerChooseEdu
                                    .textLangEduChooseTestController
                                    .clear();
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.arrow_downward_outlined))
                        ]),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget
                          .providerChooseEdu.listLangEduChooseTestTemp.length,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              widget.providerChooseEdu
                                  .listLangEduChooseTestTemp[index].name,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              maxLines: 3,
                              textAlign: TextAlign.start,
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
    );
  }
}
