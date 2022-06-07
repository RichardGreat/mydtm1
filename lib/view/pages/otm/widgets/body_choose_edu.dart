import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/choose_direction/choose_direct.dart';
import 'package:mydtm/view/pages/otm/widgets/select_direction/select_direction.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyChooseEdu(
    {required BuildContext context,
    required ProviderChooseEdu providerChooseEdu,

    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chooseDirect(context: context, providerChooseEdu: providerChooseEdu),
      MyWidgets.robotoFontText(text: "selectedDirection".tr()),
      const SizedBox(height: 20),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: providerChooseEdu.listTitleEduDir.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                if (providerChooseEdu.langId.isNotEmpty &&
                    providerChooseEdu.grantContractId.isNotEmpty &&
                    providerChooseEdu.testRegionId.isNotEmpty &&
                    providerChooseEdu.maqsadliName.isNotEmpty) {

                    pushNewScreen(context,
                        screen: SelectDirection(
                          providerChooseEdu: providerChooseEdu,
                          indexEduDir: int.parse(
                              providerChooseEdu.listTitleEduDir[index].id),
                        ));



                } else {
                  MyWidgets.scaffoldMessengerBottom(
                      context: context,
                      valueText: "Yuqoridagilarni to'ldiring");
                }
              },
              child: ListTile(
                  // isThreeLine: true,
                  subtitle:
                      Text(providerChooseEdu.listTitleEduDir[index].dirName),
                  title: MyWidgets.robotoFontText(
                    text: providerChooseEdu
                                .listTitleEduDir[index].nameEdu.length <
                            4
                        ? "${index + 1}${" ${providerChooseEdu.listTitleEduDir[index].nameTitle}"}"
                        : "${index + 1}${" ${providerChooseEdu.listTitleEduDir[index].nameEdu}"}",
                    textColor: providerChooseEdu.langId.isNotEmpty &&
                            providerChooseEdu.grantContractId.isNotEmpty &&
                            providerChooseEdu.testRegionId.isNotEmpty &&
                            providerChooseEdu.maqsadliName.isNotEmpty
                        ? MyColors.appColorBlack()
                        : MyColors.appColorGrey400(),
                  )),
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
      MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: MyColors.appColorBlue1(),
        minWidth: double.infinity,
        height: 50,
        child: MyWidgets.robotoFontText(
            text: "access".tr(), textColor: MyColors.appColorWhite()),
      )
    ],
  );
}
