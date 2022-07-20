import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/perevod/pages/old_edu/sheets/uzb_edu_sheet.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget muassasaNomi({required BuildContext context, required ProviderOldEdu providerOldEdu}){
  return          Container(
    decoration: BoxDecoration(
      color: MyColors.appColorWhite(),
    ),
    child:
    providerOldEdu.restRegionNamePerevodId!="860"?  Container(
      margin:const EdgeInsets.fromLTRB(10, 2,10,2),
      child: TextFormField(
          controller: providerOldEdu.textEditingEducation,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          maxLength: 100,
          keyboardType: TextInputType.text,
          enabled:providerOldEdu.eduLangName.length >4,

          decoration: InputDecoration(
            hintText: "eduNameType".tr(),
            hintStyle: TextStyle(color: MyColors.appColorGrey400(), fontWeight: FontWeight.w500, fontSize: 17),
            suffixIcon:
            GestureDetector(child: const Icon(Icons.clear, size: 12), onTap: () {
              providerOldEdu.textEditingEducation.clear();
            },),
            contentPadding: const EdgeInsets.all(8),
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
                color: MyColors.appColorGrey100(),
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.appColorGrey100(),
                width: 2.0,
              ),
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              color: MyColors.appColorRed(),
              fontWeight: FontWeight.w500,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.appColorGrey100(),
                width: 2.0,
              ),
            ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: MyColors.appColorBackC4()),
            // ),

          ),
          validator: (value) {
            if (value
                .toString()
                .length > 10) {

            }
            return null;
          }
      ),
    ):
    ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyWidgets.robotoFontText(
              text: "oldEduEduName".tr(), textSize: 17, textColor: providerOldEdu.eduLangName.length > 4?MyColors.appColorBlack():MyColors.appColorGrey400()),
          providerOldEdu.eduUzbName.length > 4
              ? Icon(
            Icons.check_circle,
            color: MyColors.appColorGreen1(),
          )
              : const SizedBox.shrink()
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(height: 8),
          Icon(Icons.arrow_forward_ios_sharp, size: 16),
        ],
      ),
      subtitle: Text(providerOldEdu.eduUzbName, maxLines: 1,),
      onTap: () {
       providerOldEdu.eduLangName.length > 4?
        modelSheetUzbEduPerevod(
            contexts: context, providerOldEdu: providerOldEdu):{};
        // sheetLanguageChooseTest(
        //     context: context, providerChooseEdu: providerChooseEdu);
      },
    ),
  );
}