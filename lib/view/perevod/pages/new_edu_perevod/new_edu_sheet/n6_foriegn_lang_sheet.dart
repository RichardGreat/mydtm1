import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
modelSheetForeignLangPerevod(
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
        return SizedBox(
            height: MediaQuery.of(contexts).size.height * 0.5,
            child: GetTestForeignPerevod(providerNewEduPerevod: providerNewEduPerevod));
      });
}

class GetTestForeignPerevod extends StatefulWidget {
  ProviderNewEduPerevod providerNewEduPerevod;
  GetTestForeignPerevod({Key? key, required this.providerNewEduPerevod}) : super(key: key);

  @override
  State<GetTestForeignPerevod> createState() => _GetTestForeignPerevodState();
}

class _GetTestForeignPerevodState extends State<GetTestForeignPerevod> {
  @override
  initState(){
    getForeignLang();
    super.initState();
  }

  Future getForeignLang()async{
    // await widget.providerNewEduPerevod.testRegionUser(context: context);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body:  widget.providerNewEduPerevod
        .boolCheckForeignLanguage
        ? Container(
      margin: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(height: 10),
            MyWidgets.robotoFontText(text: "chooseLangEmode".tr()),
            const  SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount:widget. providerNewEduPerevod.listForeignLang.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text: widget.providerNewEduPerevod
                            .listForeignLang[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState((){});
                    widget.providerNewEduPerevod.setForeignLanguage(
                        langName:  widget.providerNewEduPerevod.listForeignLang[index].name.toString(),
                        langId: widget.providerNewEduPerevod.listForeignLang[index].id.toString()
                            .toString());

                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ))
        : Center(child: MyWidgets.loaderDownload(context: context)),);
  }
}
