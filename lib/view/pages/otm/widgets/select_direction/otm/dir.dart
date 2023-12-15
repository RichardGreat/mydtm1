import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

sheetDIRdu(
    {required BuildContext contexts,
    required ProviderChooseEdu providerChooseEdu,
    required String eduName,
    required String eduId,
    required int titleEduDir}) {
  showModalBottomSheet(
      context: contexts,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return DIREdu(
            providerChooseEdu: providerChooseEdu,
            contexts: contexts,
            eduName: eduName,
            eduId: eduId,
            titleEduDirId: titleEduDir);
      });
}

// ignore: must_be_immutable
class DIREdu extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;
  BuildContext contexts;
  int titleEduDirId;
  String eduId;
  String eduName;

  DIREdu(
      {super.key,
      required this.providerChooseEdu,
      required this.contexts,
      required this.eduId,
      required this.eduName,
      required this.titleEduDirId});

  @override
  State<DIREdu> createState() => _DIREduState();
}

class _DIREduState extends State<DIREdu> {
  Future countValue() async {
    await widget.providerChooseEdu
        .getDir1(titleEduDir: widget.titleEduDirId, context: context);
    setState(() {});
  }

  @override
  initState() {
    countValue();
    super.initState();
  }

  @override
  Widget build(_) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: SafeArea(
        child: Container(
          child: widget.providerChooseEdu.boolDirDownload
              ? Container(
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: MyWidgets.robotoFontText(
                                      text: "chooseDirection".tr(),
                                      textSize: 28)),
                              IconButton(
                                  onPressed: () {
                                    widget.providerChooseEdu.textDir1Controller
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
                          controller:
                              widget.providerChooseEdu.textDir1Controller,
                          minLines: 1,
                          onChanged: (value) {
                            widget.providerChooseEdu.searchDir(val: value);
                            setState(() {});
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffix: IconButton(
                                onPressed: () {
                                  widget.providerChooseEdu.clearTextDir1();
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
                      const SizedBox(height: 15),
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              widget.providerChooseEdu.listDirTemp.length,
                          itemBuilder: (context, index) => GestureDetector(
                            child: Card(
                              margin: const EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  widget.providerChooseEdu.listDirTemp[index]
                                      .name,
                                  overflow: TextOverflow.fade,
                                  softWrap: true,
                                  maxLines: 4,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            onTap: () {
                              widget.providerChooseEdu.setDir1(
                                  eduId: widget.eduId,
                                  eduName: widget.eduName,
                                  nameDir: widget.providerChooseEdu
                                      .listDirTemp[index].name,
                                  idDir: widget
                                      .providerChooseEdu.listDirTemp[index].id
                                      .toString(),
                                  fLang: widget.providerChooseEdu
                                      .listDirTemp[index].flangId
                                      .toString(),
                                  titleEduDirId: widget.titleEduDirId,
                                  context: context);
                              widget.providerChooseEdu.textDir1Controller
                                  .clear();
                              setState(() {});
                              // setData(
                              //     name: widget.providerChooseEdu
                              //         .listEduChooseRegionTemp[index].regionName,
                              //     id: widget.providerChooseEdu
                              //         .listEduChooseRegionTemp[index].regionId);
                              // setState((){});
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
              : MyWidgets.loaderDownload(context: context),
        ),
      ),
    );
  }
}
