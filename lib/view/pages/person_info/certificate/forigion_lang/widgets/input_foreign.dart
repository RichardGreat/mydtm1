import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/provider_foriegn_lang.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/input_pasport.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget inputForeignCertificate(
    {required BuildContext context,
    required ProviderForeignLang providerForeignLang}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(
          text: "Chet tili sertifikatini qo'shish",
          textColor: MyColors.appColorBlack(),
          textSize: 30),
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "Chet tili", textColor: MyColors.appColorBlack(), textSize: 15),
      const SizedBox(height: 6),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          focusColor: MyColors.appColorWhite(),
          hoverColor: MyColors.appColorWhite(),
          trailing: const Icon(Icons.arrow_drop_down, size: 32),
        ),
      ),
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "Sertifikat turi",
          textColor: MyColors.appColorBlack(),
          textSize: 15),
      const SizedBox(height: 6),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          focusColor: MyColors.appColorWhite(),
          hoverColor: MyColors.appColorWhite(),
          trailing: const Icon(Icons.arrow_drop_down, size: 32),
        ),
      ),
      const SizedBox(height: 6),
      MyWidgets.robotoFontText(
          text: "Darajasi", textColor: MyColors.appColorBlack(), textSize: 15),
      const SizedBox(height: 6),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          focusColor: MyColors.appColorWhite(),
          hoverColor: MyColors.appColorWhite(),
          trailing: const Icon(Icons.arrow_drop_down, size: 32),
        ),
      ),
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "Hujjat berilgan sana",
          textColor: MyColors.appColorBlack(),
          textSize: 16),
      const SizedBox(height: 10),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          focusColor: MyColors.appColorWhite(),
          hoverColor: MyColors.appColorWhite(),
          trailing: const Icon(Icons.arrow_drop_down, size: 32),
        ),
      ),
      const SizedBox(height: 10),
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
      GestureDetector(
        onTap: () {
          providerForeignLang.addImageForeign(
              context: context, providerForeignLang: providerForeignLang);
        },
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.appColorWhite()),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Icon(Icons.image),
                MyWidgets.robotoFontText(text: "Hujjat rasmi", textSize: 14),
                MyWidgets.robotoFontText(
                    text: "jpg, png, 2MBdan oshmasligi zarur",
                    textColor: MyColors.appColorGrey400(),
                    textSize: 14),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      MaterialButton(
        height: 50,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: MyColors.appColorBlue1(),
        onPressed: () {},
        child: MyWidgets.robotoFontText(
            text: "Qo'shish", textColor: MyColors.appColorWhite()),
      )
    ],
  );
}
