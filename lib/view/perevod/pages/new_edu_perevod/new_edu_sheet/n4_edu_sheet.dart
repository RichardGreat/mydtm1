
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetEduPerevod(
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
        return SizedBox(
            height: MediaQuery.of(contexts).size.height * 0.85,
            child: GetEduPerevod(providerNewEduPerevod: providerNewEduPerevod));
      });
}

class GetEduPerevod extends StatefulWidget {
  ProviderNewEduPerevod providerNewEduPerevod;
  GetEduPerevod({Key? key, required this.providerNewEduPerevod}) : super(key: key);

  @override
  State<GetEduPerevod> createState() => _GetEduPerevodState();
}

class _GetEduPerevodState extends State<GetEduPerevod> {
  @override
  initState(){
    getEdu();
    super.initState();
  }

  Future getEdu()async{
    await widget.providerNewEduPerevod.getEdu();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  widget.providerNewEduPerevod
        .boolEdu
        ? Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller:
                    widget. providerNewEduPerevod.textEditEdu,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    onChanged: (values) {

                      widget. providerNewEduPerevod.searchEdu(val:  values.toString());
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
                    widget.   providerNewEduPerevod.closeWindowEdu(context: context);
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
                itemCount:widget. providerNewEduPerevod.listEduTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text: widget.providerNewEduPerevod
                            .listEduTemp[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState((){});
                    widget.providerNewEduPerevod.setEduNewPerevod(
                        eduName:  widget.providerNewEduPerevod.listEduTemp[index].name.toString(),
                        eduId:  widget.providerNewEduPerevod.listEduTemp[index].langId.toString()
                            .toString());

                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ))
        : Center(child: MyWidgets.loaderDownload(context: context)),);
  }
}
