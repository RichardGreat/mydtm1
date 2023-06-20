import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

sheetRegionTest(
    {required BuildContext context,
    required ProviderChooseEdu providerChooseEdu,

    }) {

  showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      builder: (contexts) {
        return  ChooseRegion(
                providerChooseEdu: providerChooseEdu, contexts: contexts);
      });
}

// ignore: must_be_immutable
class ChooseRegion extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;
  BuildContext contexts;


  ChooseRegion(
      {Key? key, required this.providerChooseEdu, required this.contexts})
      : super(key: key);

  @override
  State<ChooseRegion> createState() => _ChooseRegionState();
}

class _ChooseRegionState extends State<ChooseRegion> {

  Future countValue() async {

    await widget.providerChooseEdu.getChooseRegion(
        context: context, providerChooseEdu: widget.providerChooseEdu);
    setState(() {});
  }

  Future setData({required String name, required String id}) async {
    setState(() {});
    await widget.providerChooseEdu
        .setTestRegion(regionId: id, regionName: name);
    setState(() {});
  }

  @override
  initState() {
    countValue();
    super.initState();
  }


  @override
  Widget build(_) {

    return widget.providerChooseEdu.boolEduChoose
        ? Container(
        margin: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),


                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyWidgets.robotoFontText(text: "chooseTestRegion".tr(), textSize: 24),
                        IconButton(
                            onPressed: () {
                              widget
                                  .providerChooseEdu.textSearchRegionEduChoose
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
                    controller: widget
                        .providerChooseEdu.textSearchRegionEduChoose,
                    minLines: 1,
                    onChanged: (value) {
                      widget.providerChooseEdu
                          .searchRegionEduChoose(value: value);
                      setState(() {});
                    },
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffix: IconButton(
                          onPressed: () {
                            widget.providerChooseEdu
                                .clearTextEduChooseRegion();
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
                    itemCount: widget
                        .providerChooseEdu.listEduChooseRegionTemp.length,
                    itemBuilder: (context, index) => GestureDetector(
                      child: Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.providerChooseEdu
                                .listEduChooseRegionTemp[index].regionName,
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            maxLines: 3,
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      onTap: () {

                        widget.providerChooseEdu
                            .setTestRegion(regionId: widget
                            .providerChooseEdu.listEduChooseRegionTemp[index].regionId, regionName: widget.providerChooseEdu
                            .listEduChooseRegionTemp[index].regionName);
                        setState(() {});

                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ))
        : MyWidgets.loaderDownload(context: context);
  }
}
