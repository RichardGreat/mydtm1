import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

sheetLanguageGraphicTest(
    {required BuildContext context,
      required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: LangGraphicChooseTest(providerChooseEdu: providerChooseEdu),
          ),
        );
      });
}

class LangGraphicChooseTest extends StatefulWidget {
  late ProviderChooseEdu providerChooseEdu;

  LangGraphicChooseTest({Key? key, required this.providerChooseEdu})
      : super(key: key);

  @override
  State<LangGraphicChooseTest> createState() => _LangGraphicChooseTestState();
}

class _LangGraphicChooseTestState extends State<LangGraphicChooseTest> {
  // Future langEduChooseTest() async {
  //   // await Future.delayed(Duration(seconds: 1));
  //   await widget.providerChooseEdu.getLangEduChooseTest(
  //       context: context, providerChooseEdu: widget.providerChooseEdu);
  //   setState(() {});
  // }

  List<String> listLangGraphic =["Lotin", "Kirill", ];


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

              Expanded(
                child: ListView.builder(
                  itemCount: listLangGraphic.length,
                  itemBuilder: (context, index) => GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          listLangGraphic[index],
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    onTap: () {
                      widget.providerChooseEdu.setLanguageGraphic(name: listLangGraphic[index].toString(), id:listLangGraphic[index].toString() == "Lotin"?"1":"0");
                      // widget.providerChooseEdu.setLanguage(
                      //     name: widget.providerChooseEdu
                      //         .listLangEduChooseTestTemp[index].name,
                      //     id: widget.providerChooseEdu
                      //         .listLangEduChooseTestTemp[index].id
                      //         .toString());
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
