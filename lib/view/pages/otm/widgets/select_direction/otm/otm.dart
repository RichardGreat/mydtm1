import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
sheetOTMEdu(
    {required BuildContext contexts,
    required ProviderChooseEdu providerChooseEdu,
    required int titleEduDirId}) {
  showModalBottomSheet(
      context: contexts,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return OTMEdu(
            providerChooseEdu: providerChooseEdu,
            contexts: contexts,
            titleEduDirId: titleEduDirId);
      });
}

// ignore: must_be_immutable
class OTMEdu extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;
  BuildContext contexts;
  int titleEduDirId;

  OTMEdu(
      {super.key,
      required this.providerChooseEdu,
      required this.contexts,
      required this.titleEduDirId});

  @override
  State<OTMEdu> createState() => _OTMEduState();
}

class _OTMEduState extends State<OTMEdu> {

  Future countValue() async {
    await widget.providerChooseEdu.getOtm1(titleEduDir: widget.titleEduDirId);
    setState(() {

    });
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
        child: widget.providerChooseEdu.boolOtmData
            ? Container(
            height: MediaQuery.of(context).size.height * 0.9,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width*0.7,
                            child: MyWidgets.robotoFontText(text: "oliytalim".tr(), textSize: 26)),
                        IconButton(
                            onPressed: () {
                              widget.providerChooseEdu.textOTMChoose.clear();
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
                    widget.providerChooseEdu.textOTMChoose,
                    minLines: 1,
                    onChanged: (value) {
                      widget.providerChooseEdu.searchOtm(val: value);
                      setState(() {});
                    },
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffix: IconButton(
                          onPressed: () {
                            widget.providerChooseEdu.clearTextOtm1();
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
                    widget.providerChooseEdu.listDataOtmTemp.length,
                    itemBuilder: (context, index) => GestureDetector(
                      child: Card(
                        margin: const EdgeInsets.all(4),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Text(
                            widget.providerChooseEdu.listDataOtmTemp[index]
                                .name,
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            maxLines: 4,
                            textAlign: TextAlign.start,
                            style:const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      onTap: () {
                        widget.providerChooseEdu.setOtm1(
                          index: index.toString(),
                            contexts: context,
                            titleEduDirId: widget.titleEduDirId,
                            providerChooseEdu: widget.providerChooseEdu,
                            name: widget.providerChooseEdu
                                .listDataOtmTemp[index].name,
                            id: widget
                                .providerChooseEdu.listDataOtmTemp[index].id);
                        widget.providerChooseEdu.textOTMChoose.clear();
                        // Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ))
            : MyWidgets.loaderDownload(context: context),
    ),
      ),);
  }
}
