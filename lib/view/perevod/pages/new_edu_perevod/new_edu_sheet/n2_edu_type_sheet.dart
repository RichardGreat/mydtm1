// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetEduTypeNewPerevod(
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
                  margin:const EdgeInsets.all(10),
            height: MediaQuery.of(contexts).size.height * 0.4,
            child: GetTestEduTypeNewPerevod(
                providerNewEduPerevod: providerNewEduPerevod));
      });
}

class GetTestEduTypeNewPerevod extends StatefulWidget {
  ProviderNewEduPerevod providerNewEduPerevod;

  GetTestEduTypeNewPerevod({Key? key, required this.providerNewEduPerevod})
      : super(key: key);

  @override
  State<GetTestEduTypeNewPerevod> createState() =>
      _GetTestEduTypeNewPerevodState();
}

class _GetTestEduTypeNewPerevodState extends State<GetTestEduTypeNewPerevod> {
  @override
  initState() {
    getEduType();
    super.initState();
  }

  Future getEduType() async {
    await widget.providerNewEduPerevod.getEduTypeNewPerevod();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: widget.providerNewEduPerevod.boolEduTypeNewPerevod
          ? Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MyWidgets.robotoFontText(text: "chooseEduType".tr(),
                    textSize: 18,
                      textColor: MyColors.appColorBBA()
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget
                          .providerNewEduPerevod.listEduTypeNewPerevod.length,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: MyWidgets.robotoFontText(
                              text: widget.providerNewEduPerevod
                                  .listEduTypeNewPerevod[index].name,
                              textSize: 18
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {});
                          widget.providerNewEduPerevod.setEfuNewPerevod(
                              eduTypeName: widget.providerNewEduPerevod
                                  .listEduTypeNewPerevod[index].name
                                  .toString(),
                              eduTypeId: widget.providerNewEduPerevod
                                  .listEduTypeNewPerevod[index].id
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
