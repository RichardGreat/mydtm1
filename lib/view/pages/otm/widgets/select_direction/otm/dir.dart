import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetDIRdu({required BuildContext contexts,
  required ProviderChooseEdu providerChooseEdu,
  required int titleEduDir}) {
  showModalBottomSheet(
      context: contexts,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return DIREdu(
            providerChooseEdu: providerChooseEdu,
            contexts: contexts,
            titleEduDirId: titleEduDir);
      });
}

// ignore: must_be_immutable
class DIREdu extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;
  BuildContext contexts;
  int titleEduDirId;

  DIREdu({Key? key,
    required this.providerChooseEdu,
    required this.contexts,
    required this.titleEduDirId})
      : super(key: key);

  @override
  State<DIREdu> createState() => _DIREduState();
}

class _DIREduState extends State<DIREdu> {
  Future countValue() async {

    await widget.providerChooseEdu.getDir1(titleEduDir: widget.titleEduDirId, context: context);
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
      child: widget.providerChooseEdu.boolDirDownload
          ? Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.95,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        height: 50,
                        child: TextFormField(
                          controller:
                          widget.providerChooseEdu.textDir1Controller,
                          minLines: 1,
                          onChanged: (value) {
                            widget.providerChooseEdu
                                .searchDir(val: value);
                            setState(() {});
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffix: IconButton(
                                onPressed: () {
                                  widget.providerChooseEdu
                                      .clearTextDir1();
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
                            widget.providerChooseEdu.textDir1Controller
                                .clear();
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_downward_outlined))
                    ]),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.providerChooseEdu.listDirTemp.length,
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              widget.providerChooseEdu.listDirTemp[index].name,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              maxLines: 3,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        onTap: () {

                          widget.providerChooseEdu.setDir1(
                              nameDir:  widget.providerChooseEdu.listDirTemp[index].name,
                              idDir:  widget.providerChooseEdu.listDirTemp[index].id.toString(),
                              fLang: widget.providerChooseEdu.listDirTemp[index].flangId.toString(),
                              titleEduDirId: widget.titleEduDirId,
                            context: context
                          );
                          setState((){});
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
    );
  }
}
