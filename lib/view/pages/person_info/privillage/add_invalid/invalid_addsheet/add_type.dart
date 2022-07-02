import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/privillage/add_invalid/provider_add_invalide.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

modelInvalidType({
  required BuildContext context,
  required ProviderAddInvalide providerAddInvalide,
}) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: MyColors.appColorGrey100(),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) {
        return SheetGetSetLang(
          providerAddInvalide: providerAddInvalide,
        );
      });
}

// ignore: must_be_immutable
class SheetGetSetLang extends StatefulWidget {
  ProviderAddInvalide providerAddInvalide;

  SheetGetSetLang({
    Key? key,
    required this.providerAddInvalide,
  }) : super(key: key);

  @override
  State<SheetGetSetLang> createState() => _SheetGetSetLangState();
}

class _SheetGetSetLangState extends State<SheetGetSetLang> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.35,
        margin: const EdgeInsets.only(right: 10, left: 10),
        decoration: BoxDecoration(
            color: MyColors.appColorGrey100(),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(4, 0, 5, 0),
              padding: const EdgeInsets.all(5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyWidgets.robotoFontText(
                        text: "invalidChooseGroup".tr(),
                        textSize: 20,
                        textFontWeight: FontWeight.w500),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close))
                  ]),
            ),
            GestureDetector(
              onTap: () {
                widget.providerAddInvalide.getInvallidType(invalidTypes: "1");

                Navigator.of(context).pop();
              },
              child: Container(
                height: 45,
                width: double.infinity,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: MyColors.appColorGrey100(),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: MyColors.appColorGrey400(),
                          blurRadius: 0.5,
                          spreadRadius: 0.5)
                    ]),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: MyWidgets.robotoFontText(
                      text: "invalid1".tr(),
                      textSize: 17,
                      textFontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                widget.providerAddInvalide.getInvallidType(invalidTypes: "2");
                Navigator.of(context).pop();
              },
              child: Container(
                height: 45,
                width: double.infinity,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: MyColors.appColorGrey100(),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: MyColors.appColorGrey400(),
                          blurRadius: 0.5,
                          spreadRadius: 0.5)
                    ]),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: MyWidgets.robotoFontText(
                      text: "invalid2".tr(),
                      textSize: 17,
                      textFontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ));
  }
}
