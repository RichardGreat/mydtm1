import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/choose_edu/provider_choose_edu_t.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetDirectionTexnikum({
  required BuildContext contexts,
  required ProviderChooseEduTexnikum providerChooseEduTexnikum,
}) {
  showModalBottomSheet(
      context: contexts,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(contexts).size.height * 0.7,
          child: EducationChooseTexnikum(
            providerChooseEduTexnikum: providerChooseEduTexnikum,
            contexts: contexts,
          ),
        );
      });
}

// ignore: must_be_immutable
class EducationChooseTexnikum extends StatefulWidget {
  ProviderChooseEduTexnikum providerChooseEduTexnikum;
  BuildContext contexts;

  EducationChooseTexnikum(
      {Key? key,
      required this.providerChooseEduTexnikum,
      required this.contexts})
      : super(key: key);

  @override
  State<EducationChooseTexnikum> createState() =>
      _EducationChooseTexnikumState();
}

class _EducationChooseTexnikumState extends State<EducationChooseTexnikum> {
  Future getChooseEducation() async {
    await widget.providerChooseEduTexnikum.getEduDirTexnikum();
    setState(() {});
  }

  @override
  initState() {
    getChooseEducation();
    super.initState();
  }

  @override
  Widget build(_) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: Container(
        child: widget.providerChooseEduTexnikum.boolEduDirectionTex
            ? Container(
                height: MediaQuery.of(context).size.height * 0.7,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: 50,
                              child: TextFormField(
                                controller: widget.providerChooseEduTexnikum
                                    .textEduDirectionController,
                                minLines: 1,
                                onChanged: (value) {
                                  widget.providerChooseEduTexnikum
                                      .searchDirectionTex(val: value);
                                  setState(() {});
                                },
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  suffix: IconButton(
                                      onPressed: () {
                                        // widget.providerChooseEduTexnikum.clearTextOtm1();
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
                                  // widget.providerChooseEduTexnikum.textOTMChoose.clear();
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(CupertinoIcons.chevron_down))
                          ]),
                    ),

                    Expanded(
                      child: ListView.builder(
                        itemCount: widget
                            .providerChooseEduTexnikum.listMvDirTexTemp.length,
                        itemBuilder: (context, index) => GestureDetector(
                          child: Card(
                            margin: const EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget.providerChooseEduTexnikum
                                    .listMvDirTexTemp[index].name,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          onTap: () {
                            widget.providerChooseEduTexnikum
                                .setDirectionInfoTexnikum(
                                    nameDirectionTex: widget
                                        .providerChooseEduTexnikum
                                        .listMvDirTexTemp[index]
                                        .name,
                                    idDirectionTex: widget
                                        .providerChooseEduTexnikum
                                        .listMvDirTexTemp[index]
                                        .langId
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
