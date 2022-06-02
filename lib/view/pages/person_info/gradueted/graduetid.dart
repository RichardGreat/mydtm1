import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/gradueted/app_bar_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/button_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/const_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_forgione/g_forgione.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_uzbek/graduated_uzbek.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/input_pasport.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class Graduated extends StatefulWidget {
  const Graduated({Key? key}) : super(key: key);

  @override
  State<Graduated> createState() => _GraduatedState();
}

class _GraduatedState extends State<Graduated> {
  ProviderGraduated providerGraduated = ProviderGraduated();

  @override
  initState() {
    providerGraduated.getAllInfoGraduated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerGraduated,
      child: Consumer<ProviderGraduated>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          appBar: appBarGradueted(
              context: context, providerGradueted: providerGraduated),
          body: 
              providerGraduated.boolAllInfoGraduated ?
          
          Form(
              key: providerGraduated.formKeyGraduated,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// header
                      constGraduated(
                          context: context,
                          providerGraduated: providerGraduated),

                      /// uzbek
                      Visibility(
                          visible: providerGraduated.boolGraduatedType,
                          child: graduatedUzbek(
                              context: context,
                              providerGradueted: providerGraduated)),

                      /// foreign
                      Visibility(
                          visible: !providerGraduated.boolGraduatedType,
                          child: graduatedForeign(
                              context: context,
                              providerGraduated: providerGraduated)),

                      /// button

                      const SizedBox(height: 10),
                      MyWidgets.robotoFontText(
                          text: "bYear".tr(),
                          textColor: MyColors.appColorGrey400(),
                          textSize: 16),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          providerGraduated.getYear(
                              contexts: context,
                              providerGraduated: providerGraduated);
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: MyColors.appColorGrey400()),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyWidgets.robotoFontText(
                                  text: providerGraduated
                                              .gYear .length <
                                          3
                                      ? "choose".tr()
                                      : providerGraduated.gYear ),
                              const Icon(Icons.arrow_drop_down_outlined)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      MyWidgets.robotoFontText(
                          text: "document".tr(),
                          textColor: MyColors.appColorGrey400(),
                          textSize: 16),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: providerGraduated.textEditingSerNumber,
                        maxLines: 1,
                        maxLength: 25,

                        keyboardType: TextInputType.text,

                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp('[0-9]'))
                        // ],
                        decoration: InputDecoration(
                          counter: const SizedBox.shrink(),
                          contentPadding:
                              const EdgeInsets.only(left: 8, right: 8),
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
                          if (value3!.isEmpty || value3.length <= 3) {
                            // providerPersonInfo.boolPsNumber(boolNum: false);
                            return "Uzunlik 3 birlikdan ko'p bo'lishi kerak";
                          } else {
                            // providerPersonInfo.boolPsNumber(boolNum: true);
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      buttonGraduated(
                          context: context,
                          providerGradueted: providerGraduated)
                    ],
                  ),
                ),
              )):
          MyWidgets.loaderDownload(context: context)
          ,
        ),
      ),
    );
  }
}
