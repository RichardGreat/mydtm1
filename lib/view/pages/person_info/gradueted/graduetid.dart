import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/check_information_page.dart';
import 'package:mydtm/view/pages/person_info/gradueted/app_bar_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/button_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/const_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_forgione/g_forgione.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_uzbek/graduated_uzbek.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class Graduated extends StatefulWidget {
  Function funcState;
  String windowIdGraduated = "0";

  Graduated(
      {Key? key, required this.funcState, required this.windowIdGraduated})
      : super(key: key);

  @override
  State<Graduated> createState() => _GraduatedState();
}

class _GraduatedState extends State<Graduated> {
  ProviderGraduated providerGraduated = ProviderGraduated();
  var box = Hive.box("online");

  @override
  initState() {
    log(box.get("token"));
    providerGraduated.getAllInfoGraduated();
    super.initState();
  }

  // box.put("categoryName", categoryName);
  // box.put("categoryNameId", categoryId);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerGraduated,
      child: Consumer<ProviderGraduated>(
        builder: (context, value, child) => WillPopScope(
          onWillPop: () async {
            if (widget.windowIdGraduated == "0") {
              widget.funcState();
              pushNewScreen(context,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  screen: CheckInformation(
                      serviceName: box.get("categoryName").toString()));
            } else if (widget.windowIdGraduated == "1") {
              Navigator.of(context).pop();
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: MyColors.appColorWhite(),
            appBar: appBarGradueted(
                context: context, providerGradueted: providerGraduated),
            body: providerGraduated.boolAllInfoGraduated
                ? Form(
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
                                    providerGradueted: providerGraduated)),

                            /// button
                            const SizedBox(height: 20),
                            MyWidgets.robotoFontText(
                                text: "bYear".tr(),
                                textColor: MyColors.appColorBlack(),
                                textSize: 16),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {
                                if (providerGraduated.graduatedEduTypeId ==
                                        "4" &&
                                    providerGraduated
                                            .graduatedCountryName.length >=
                                        5 &&
                                    providerGraduated.txtControllerGraduatedName
                                            .text.length >=
                                        4) {
                                  providerGraduated.getYear(
                                      contexts: context,
                                      providerGraduated: providerGraduated);
                                } else if (providerGraduated
                                            .graduatedEduTypeId !=
                                        "4" &&
                                    providerGraduated.graduatedEduName.length >
                                        5) {
                                  providerGraduated.getYear(
                                      contexts: context,
                                      providerGraduated: providerGraduated);
                                }
                              },
                              child: Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: MyColors.appColorGrey400()),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyWidgets.robotoFontText(
                                      text: providerGraduated
                                                  .graduatedEduYear.length <
                                              3
                                          ? "choose".tr()
                                          : providerGraduated.graduatedEduYear,
                                    ),
                                    const Icon(Icons.arrow_drop_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            MyWidgets.robotoFontText(
                                text: "document".tr(),
                                textColor: MyColors.appColorBlack(),
                                textSize: 16),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller:
                                  providerGraduated.textEditingSerNumber,
                              maxLines: 1,
                              maxLength: 25,
                              keyboardType: TextInputType.text,
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
                                if (value3!.isEmpty || value3.length < 6) {
                                  // providerPersonInfo.boolPsNumber(boolNum: false);
                                  return "kodLength6".tr();
                                } else {
                                  // providerPersonInfo.boolPsNumber(boolNum: true);
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            buttonGraduated(
                              idWindowIds: widget.windowIdGraduated,
                                function: widget.funcState,
                                // modelCheckUserInfo: widget.modelCheckUserInfo,
                                context: context,
                                providerGradueted: providerGraduated)
                          ],
                        ),
                      ),
                    ))
                : MyWidgets.loaderDownload(context: context),
          ),
        ),
      ),
    );
  }
}
