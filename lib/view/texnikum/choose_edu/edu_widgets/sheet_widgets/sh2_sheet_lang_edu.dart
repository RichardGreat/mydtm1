import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/choose_edu/provider_choose_edu_t.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetEduLangTexnikum({
  required BuildContext contexts,
  required ProviderChooseEduTexnikum providerChooseEduTexnikum,
}) {
  showModalBottomSheet(
      context: contexts,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(contexts).size.height * 0.35,
          child: EduChooseTexnikum(
            providerChooseEduTexnikum: providerChooseEduTexnikum,
            contexts: contexts,
          ),
        );
      });
}

// ignore: must_be_immutable
class EduChooseTexnikum extends StatefulWidget {
  ProviderChooseEduTexnikum providerChooseEduTexnikum;
  BuildContext contexts;

  EduChooseTexnikum(
      {Key? key,
      required this.providerChooseEduTexnikum,
      required this.contexts})
      : super(key: key);

  @override
  State<EduChooseTexnikum> createState() => _EduChooseTexnikumState();
}

class _EduChooseTexnikumState extends State<EduChooseTexnikum> {
  Future countValue() async {
    await widget.providerChooseEduTexnikum.getLangEduTexnikum(context: context);
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
      body: Container(
        child: widget.providerChooseEduTexnikum.boolEduLangTexnikum
            ? Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         SizedBox(
                    //             width: MediaQuery.of(context).size.width*0.7,
                    //             child: MyWidgets.robotoFontText(text: "oliytalim".tr(), textSize: 26)),
                    //         IconButton(
                    //             onPressed: () {
                    //               widget.providerChooseEduTexnikum.textOTMChoose.clear();
                    //               Navigator.of(context).pop();
                    //             },
                    //             icon: const Icon(CupertinoIcons.chevron_down))
                    //       ]),
                    // ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.9,
                    //   height: 50,
                    //   child: TextFormField(
                    //     controller:
                    //     widget.providerChooseEdu.textOTMChoose,
                    //     minLines: 1,
                    //     onChanged: (value) {
                    //       widget.providerChooseEdu.searchOtm(val: value);
                    //       setState(() {});
                    //     },
                    //     textAlignVertical: TextAlignVertical.center,
                    //     decoration: InputDecoration(
                    //       prefixIcon: const Icon(Icons.search),
                    //       suffix: IconButton(
                    //           onPressed: () {
                    //             widget.providerChooseEdu.clearTextOtm1();
                    //             setState(() {});
                    //           },
                    //           icon: const Icon(
                    //             Icons.clear,
                    //             size: 12,
                    //           )),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide(
                    //           color: MyColors.appColorGrey400(),
                    //         ),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide(
                    //           color: MyColors.appColorGrey400(),
                    //         ),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide(
                    //           color: MyColors.appColorGrey400(),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 15),
                    const SizedBox(height: 10),
                    MyWidgets.robotoFontText(text: "choose lang"),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.providerChooseEduTexnikum
                            .modelLangEduTexnikum.lang.length,
                        itemBuilder: (context, index) => GestureDetector(
                          child: Card(
                            margin: const EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget.providerChooseEduTexnikum
                                    .modelLangEduTexnikum.lang[index].name,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          onTap: () {
                            widget.providerChooseEduTexnikum.setLangEduTexnikum(
                                idEduLang: widget.providerChooseEduTexnikum
                                    .modelLangEduTexnikum.lang[index].langId
                                    .toString(),
                                nameEduLang: widget.providerChooseEduTexnikum
                                    .modelLangEduTexnikum.lang[index].name.toString());
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
