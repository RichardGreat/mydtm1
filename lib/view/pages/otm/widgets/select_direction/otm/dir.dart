import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetOTMEdu(
    {required BuildContext contexts,
      required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      context: contexts,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return OTMEdu(providerChooseEdu: providerChooseEdu, contexts: contexts);
      });
}

// ignore: must_be_immutable
class OTMEdu extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;
  BuildContext contexts;

  OTMEdu({Key? key, required this.providerChooseEdu, required this.contexts})
      : super(key: key);

  @override
  State<OTMEdu> createState() => _OTMEduState();
}

class _OTMEduState extends State<OTMEdu> {
  Future countValue() async {
    // await Future.delayed(Duration(seconds: 1));
    await widget.providerChooseEdu.getOtm1();
    setState(() {});
  }

  // Future setData({required String name, required String id}) async {
  //   await widget.providerChooseEdu
  //       .setTestRegion(regionId: id, regionName: name);
  //   setState(() {});
  // }

  @override
  initState() {

    countValue();
    // super.initState();
  }

  @override
  Widget build(_) {
    return Container(
      child: widget.providerChooseEdu.boolOtmData
          ? Container(
          height: MediaQuery.of(context).size.height * 0.95,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        child: TextFormField(
                          controller: widget
                              .providerChooseEdu.textOTMChoose,
                          minLines: 1,
                          onChanged: (value) {
                            widget.providerChooseEdu
                                .searchOtm(val: value);
                            setState(() {});
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffix: IconButton(
                                onPressed: () {
                                  widget.providerChooseEdu
                                      .clearTextOtm1();
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
                            widget
                                .providerChooseEdu.textOTMChoose
                                .clear();
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_downward_outlined))
                    ]),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget
                      .providerChooseEdu.listDataOtmTemp.length,
                  itemBuilder: (context, index) => GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.providerChooseEdu
                              .listDataOtmTemp[index].name,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    onTap: () {
                      // setData(
                      //     name: widget.providerChooseEdu
                      //         .listEduChooseRegionTemp[index].regionName,
                      //     id: widget.providerChooseEdu
                      //         .listEduChooseRegionTemp[index].regionId);
                      // setState((){});
                      Navigator.of(context).pop();
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
