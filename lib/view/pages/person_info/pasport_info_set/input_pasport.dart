import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/model_sheet_passport.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
Widget inputPassportInfo(
    {required BuildContext context,
    required ProviderPersonInfo providerPersonInfo}) {
  List<String> jshshir = ["2", "3", "4", "5", "6"];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(text: "Shaxsiy ma'lumot", textSize: 28),
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(
          text: "Barcha qatorlarni to'ldiring",
          textSize: 15,
          textColor: MyColors.appColorGrey600()),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyWidgets.robotoFontText(text: "SHSHIR"),
          // modelSheetPassportIdCard
          GestureDetector(
            onTap: (){
              modelSheetPassportIdCard(context: context, providerPersonInfo: providerPersonInfo);
            },
            child: MyWidgets.robotoFontText(
                text: "Bu qanday aniqlanadi?",
                textColor: MyColors.appColorBlue1()),
          ),
        ],
      ),
      const SizedBox(height: 5),

      /// JShSHIR
      TextFormField(
          controller: providerPersonInfo.txtJShShIRController,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          maxLength: 14,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          // inputFormatters: <TextInputFormatter>[
          //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          // ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.appColorGreen2(),
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
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: MyColors.appColorBackC4()),
            // ),
          ),
          validator: (value) {
            if (value == null || value.length < 14) {
              providerPersonInfo.boolShShIR(boolShiR: false);
              if (value!.length > 1) {
                String kod = value.substring(0, 1);
                for (var element in jshshir) {
                  if (element.contains(kod)) {
                    providerPersonInfo.myBoolWidget = true;
                    break;
                  } else {
                    providerPersonInfo.myBoolWidget = false;
                  }
                }
                if (!providerPersonInfo.myBoolWidget && value.length < 2) {
                  return "jshshir xato".tr();
                } else {
                  return "jshshir xato".tr();
                }
              } else {
                return "jshshir xato".tr();
              }
            } else {
              String kod = value.substring(0, 1);
              for (var element in jshshir) {
                if (element.contains(kod)) {
                  providerPersonInfo.myBoolWidget = true;
                  providerPersonInfo.boolShShIR(boolShiR: true);
                  break;
                } else {
                  providerPersonInfo.boolShShIR(boolShiR: false);
                  providerPersonInfo.myBoolWidget = false;
                }
              }
              if (!providerPersonInfo.myBoolWidget) {
                providerPersonInfo.boolShShIR(boolShiR: false);
                return "jshshir xato".tr();
              } else {
                providerPersonInfo.boolShShIR(boolShiR: true);
              }
            }
            return null;
          }),
      const SizedBox(height: 5),
      MyWidgets.robotoFontText(text: "Pasport seriya va raqami"),
      const SizedBox(height: 5),
      Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 50,
            /// Ps Set
            child: TextFormField(
              controller: providerPersonInfo.txtPsSerController,
              maxLength: 2,
              maxLines: 1,
              inputFormatters: <TextInputFormatter>[UpperCaseTextFormatter(),
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              textAlign: TextAlign.center,
              decoration: InputDecoration(

                contentPadding: const EdgeInsets.all(8),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: MyColors.appColorGreen2(),
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
              validator: (value){
                if(value == null  || value.length < 2){
                  providerPersonInfo.boolPsSera(boolSer: false);
                return "..";}
                else{
                  providerPersonInfo.boolPsSera(boolSer: true);
                  return null;
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: providerPersonInfo.txtPsNumController,
              maxLines: 1,
              maxLength: 7,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 8, right: 8),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: MyColors.appColorGreen2(),
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
                // focusedBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(color: MyColors.appColorBackC4()),
                // ),
              ),
              validator: (value3){
                if(value3!.isEmpty || value3.length < 7){
                  providerPersonInfo.boolPsNumber(boolNum: false);
                  return "uzunlikda xato";
                }else{
                  providerPersonInfo.boolPsNumber(boolNum: true);
                  return null;
                }

              },
            ),
          )
        ],
      ),
    ],
  );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return value.toUpperCase();
}
