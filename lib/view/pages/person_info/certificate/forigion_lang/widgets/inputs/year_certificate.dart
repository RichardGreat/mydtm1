import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/provider_foriegn_lang.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/input_pasport.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget certificateGetYear({required BuildContext context, required ProviderForeignLang providerForeignLang}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "Hujjat seriyasi va raqami",
          textColor: MyColors.appColorBlack(),
          textSize: 16),
      const SizedBox(height: 4),
      Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 50,

            /// Ps Set
            child: TextFormField(
              // controller: providerPersonInfo.txtPsSerController,
              maxLength: 2,
              maxLines: 1,
              inputFormatters: <TextInputFormatter>[
                UpperCaseTextFormatter(),
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counter: const SizedBox.shrink(),
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
              validator: (value) {
                if (value == null || value.length < 2) {
                  // providerPersonInfo.boolPsSera(boolSer: false);
                  return "..";
                } else {
                  // providerPersonInfo.boolPsSera(boolSer: true);
                  return null;
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              // controller: providerPersonInfo.txtPsNumController,
              maxLines: 1,
              maxLength: 7,

              keyboardType: TextInputType.number,

              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              decoration: InputDecoration(
                counter: const SizedBox.shrink(),
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
              validator: (value3) {
                if (value3!.isEmpty || value3.length < 7) {
                  // providerPersonInfo.boolPsNumber(boolNum: false);
                  return "uzunlikda xato";
                } else {
                  // providerPersonInfo.boolPsNumber(boolNum: true);
                  return null;
                }
              },
            ),
          )
        ],
      ),
      const SizedBox(height: 20),

    ],);
}