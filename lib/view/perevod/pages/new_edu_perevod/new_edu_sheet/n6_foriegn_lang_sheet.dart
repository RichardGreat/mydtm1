
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetTestRegionPerevod(
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
            height: MediaQuery.of(contexts).size.height * 0.85,
            child: GetTestRegionPerevod(providerNewEduPerevod: providerNewEduPerevod));
      });
}

class GetTestRegionPerevod extends StatefulWidget {
  ProviderNewEduPerevod providerNewEduPerevod;
  GetTestRegionPerevod({Key? key, required this.providerNewEduPerevod}) : super(key: key);

  @override
  State<GetTestRegionPerevod> createState() => _GetTestRegionPerevodState();
}

class _GetTestRegionPerevodState extends State<GetTestRegionPerevod> {
  @override
  initState(){
    getForeignCountry();
    super.initState();
  }

  Future getForeignCountry()async{
    await widget.providerNewEduPerevod.testRegionUser(context: context);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  widget.providerNewEduPerevod
        .boolTestRegion
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
                    widget. providerNewEduPerevod.textEditNewEduSearch,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    onChanged: (values) {

                      widget. providerNewEduPerevod.searchTestRegion(val:  values.toString());
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
                    widget.   providerNewEduPerevod.closeWindowPerevod(context: context);
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
                itemCount:widget. providerNewEduPerevod.listTestRegionTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text: widget.providerNewEduPerevod
                            .listTestRegionTemp[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState((){});
                    widget.providerNewEduPerevod.setTestRegionNewEdu(
                        regionName: widget.providerNewEduPerevod.listTestRegionTemp[index].name.toString(),
                        regionId: widget.providerNewEduPerevod.listTestRegionTemp[index].id.toString()
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
