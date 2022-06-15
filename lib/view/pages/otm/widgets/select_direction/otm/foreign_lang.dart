import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'dart:developer';
sheetForeignLang({
  required BuildContext contexts,
  required ProviderChooseEdu providerChooseEdu,
}) {
  showModalBottomSheet(
      context: contexts,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return ForeignLangTest(
          providerChooseEdu: providerChooseEdu,
          contexts: contexts,
        );
      });
}

// ignore: must_be_immutable
class ForeignLangTest extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;
  BuildContext contexts;

  ForeignLangTest({
    Key? key,
    required this.providerChooseEdu,
    required this.contexts,
  }) : super(key: key);

  @override
  State<ForeignLangTest> createState() => _ForeignLangTestState();
}

class _ForeignLangTestState extends State<ForeignLangTest> {
  Future countValue() async {
    await widget.providerChooseEdu.getForeignLangMethod();
    setState(() {});
  }

  @override
  initState() {
    countValue();
    super.initState();
  }

  @override
  Widget build(_) {
    return Container(
      child: widget.providerChooseEdu.boolForeignLanguage
          ? Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: ListView.builder(
                itemCount:
                    widget.providerChooseEdu.listDataForeignLangTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.providerChooseEdu.listDataForeignLangTemp[index]
                            .name,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  onTap: () {
                    log(widget.providerChooseEdu
                        .listDataForeignLangTemp[index].id.toString());
                    widget.providerChooseEdu.setForeignLang(
                        id: widget.providerChooseEdu
                            .listDataForeignLangTemp[index].id,
                        name: widget.providerChooseEdu
                            .listDataForeignLangTemp[index].name);
                    Navigator.of(context).pop();
                  },
                ),
              ))
          : MyWidgets.loaderDownload(context: context),
    );
  }
}
