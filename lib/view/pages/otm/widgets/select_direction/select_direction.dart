// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class SelectDirection extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;
  int indexEduDir;

  SelectDirection(
      {Key? key, required this.providerChooseEdu, required this.indexEduDir})
      : super(key: key);

  @override
  State<SelectDirection> createState() => _SelectDirectionState();
}

class _SelectDirectionState extends State<SelectDirection> {

  Future getEmodes({required BuildContext context} ) async {
    if (widget.indexEduDir == 0) {
      await widget.providerChooseEdu.getEmode(context: context);
    } else {
      await widget.providerChooseEdu.getEmode2(indexEduDir: widget.indexEduDir, context: context);
    }
    setState(() {});
  }

  @override
  initState() {
    getEmodes( context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: MyColors.appColorBlack()),
          elevation: 0,
          backgroundColor: MyColors.appColorWhite()),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(10),
        // listEmodeChoose
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: MyWidgets.robotoFontText(
                  text: "chooseEduType".tr(), textSize: 28),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: widget.providerChooseEdu.boolGetEmode
                  ?  ListView.builder(
                itemCount:

                widget.providerChooseEdu.listEmodeChoose.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    index != 0 ? const Divider(thickness:  0.7):const SizedBox.shrink(),
                    ListTile(

                      title: MyWidgets.robotoFontText(
                          text: widget
                              .providerChooseEdu.listEmodeChoose[index].name,
                          textSize: 17),

                      trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 16),
                      onTap: () {
                        widget.providerChooseEdu.setEMode(
                            emodeId: widget.indexEduDir.toString(),
                            titleEduDirId: widget.indexEduDir,
                            context: context,
                            providerChooseEdu: widget.providerChooseEdu,
                            name: widget.providerChooseEdu
                                .listEmodeChoose[index].name,
                            id: widget.providerChooseEdu
                                .listEmodeChoose[index].id);
                      },
                    ),
                  ],
                ),
              )
                  : MyWidgets.loaderDownload(context: context),
            )
          ],
        ),
      )),
    );
  }
}
