import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyChooseEdu(
    {required BuildContext context,
    required ProviderChooseEdu providerChooseEdu}) {
  List<String> listDirection = [
    "Test topshirishish hududi",
    "Ta'lim tili",
    "Tanlov ustuvorligi"
  ];
  List<String> listSelectDirection = [
    "1 Oliy ta'lim muassasi",
    "2 Oliy ta'lim muassasi",
    "3 Oliy ta'lim muassasi",
    "4 Oliy ta'lim muassasi",
    "5 Oliy ta'lim muassasi",
    "Chet tili tanlash",
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(text: "chooseDirection".tr(), textSize: 24),
      const SizedBox(height: 20),
      Container(
        decoration: BoxDecoration(color: MyColors.appColorWhite(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
        ),
        child: ListTile(
          title: MyWidgets.robotoFontText(text: listDirection[0], textSize: 20),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
        ),
      ),
      Container(
        decoration: BoxDecoration(color: MyColors.appColorWhite(),

        ),
        child: ListTile(
          title: MyWidgets.robotoFontText(text: listDirection[1], textSize: 20),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
        ),
      ),
      Container(
        decoration: BoxDecoration(color: MyColors.appColorWhite()),
        child: ListTile(
          title: MyWidgets.robotoFontText(text: listDirection[2], textSize: 20),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
        ),
      ),
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(text: "selectedDirection"),
      const SizedBox(height: 20),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: MyColors.appColorWhite(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: ListView.builder(
            itemCount: listSelectDirection.length,
            itemBuilder: (context, index) => ListTile(
                title:
                    MyWidgets.robotoFontText(text: listSelectDirection[index])),
          ),
        ),
      ),
      const SizedBox(height: 20),
      MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: MyColors.appColorBlue1(),
        minWidth: double.infinity,
        height: 50,
        child: MyWidgets.robotoFontText(
            text: "Tasdiqlash", textColor: MyColors.appColorWhite()),
      )
    ],
  );
}
