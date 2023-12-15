// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetEduDirPerevod(
    {required BuildContext contexts, required ProviderOldEdu providerOldEdu}) {
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
            height: MediaQuery.of(contexts).size.height * 0.85,
            child: EduDirPerevodSheet(providerOldEdu: providerOldEdu));
      });
}

class EduDirPerevodSheet extends StatefulWidget {
  ProviderOldEdu providerOldEdu;

  EduDirPerevodSheet({super.key, required this.providerOldEdu});

  @override
  State<EduDirPerevodSheet> createState() => _EduDirPerevodSheetState();
}

class _EduDirPerevodSheetState extends State<EduDirPerevodSheet> {
  @override
  initState() {
    getForeignCountry();
    super.initState();
  }

  Future getForeignCountry() async {
    await widget.providerOldEdu.getEduDir();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.providerOldEdu.boolEduDirection
          ? Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: widget
                          .providerOldEdu.textControllerCountryPerevod,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      onChanged: (values) {
                        widget.providerOldEdu
                            .searchEduDir(dirName: values.toString());
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        counter: const SizedBox.shrink(),
                        contentPadding:
                        const EdgeInsets.only(left: 8, right: 8),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: MyColors.appColorBlue1(),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: MyColors.appColorGrey400(),
                            width: 1.5,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: MyColors.appColorBlue1(),
                            width: 1.5,
                          ),
                        ),
                        errorStyle: TextStyle(
                          color: MyColors.appColorRed(),
                          fontWeight: FontWeight.w500,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: MyColors.appColorBlue1(),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      widget.providerOldEdu
                          .closeWindowPerevod(context: context);
                    },
                    icon: Icon(CupertinoIcons.chevron_down,
                        color: MyColors.appColorBlack()),
                  )
                  // GestureDetector(child: Padding(
                  //   padding: const EdgeInsets.only(right: 10),
                  //   child: Icon(CupertinoIcons.chevron_down, color: MyColors.appColorBlack()),
                  // ),)
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:
                  widget.providerOldEdu.listDataMVDirTemp.length,
                  itemBuilder: (context, index) => GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: MyWidgets.robotoFontText(
                          text: widget.providerOldEdu
                              .listDataMVDirTemp[index].name,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {});
                      widget.providerOldEdu.setEduDirection(
                          dirId: widget.providerOldEdu
                              .listDataMVDirTemp[index].langId
                              .toString(),
                          dirName:  widget.providerOldEdu
                              .listDataMVDirTemp[index].name
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
