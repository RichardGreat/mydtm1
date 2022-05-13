import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:mydtm/view/pages/person_info/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget inputPassportInfo(


    {required BuildContext context,
    required ProviderPersonInfo providerPersonInfo}) {
List<String> jshshir = [
        "2",
        "3",
        "4",
        "5",
        "6"
    ];


    return Column(
        children: [
            const SizedBox(height: 20),
            /// JShSHIR
            TextFormField(
                maxLines: 1,
                textAlignVertical: TextAlignVertical.center,
                maxLength: 14,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: MyColors.appColorBlue2(),
                        ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: MyColors.appColorGrey400(),
                            width: 2.0,
                        ),
                    ),
                    focusedErrorBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: MyColors.appColorGrey400(),
                            width: 2.0,
                        ),
                    ),
                    errorStyle: TextStyle(
                        color: MyColors.appColorRed(),
                        fontWeight: FontWeight.w500,
                    ),
                    errorBorder:  OutlineInputBorder(
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
                    if (value == null || value.length < 14) {
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
                                return "kodError".tr();
                            } else {
                                return "kodLength".tr();
                            }
                        } else {
                            return "jshshir".tr();
                        }
                    } else {
                        String kod = value.substring(0, 1);
                        for (var element in jshshir) {
                            if (element.contains(kod)) {
                                providerPersonInfo.myBoolWidget = true;
                                providerPersonInfo.boolButtonCol1(boolValue: true);
                                break;
                            } else {
                                providerPersonInfo.boolButtonCol1(boolValue: false);
                                providerPersonInfo.myBoolWidget = false;
                            }
                        }
                        if (!providerPersonInfo.myBoolWidget) {
                            providerPersonInfo.boolButtonCol1(boolValue: false);
                            return "kodError".tr();
                        } else {
                            providerPersonInfo.boolButtonCol1(boolValue: true);
                        }
                    }
                    return null;
                }
            ),
            const SizedBox(height: 20),
            Row(children: [
                Container(
                    alignment: Alignment.center,
                    width: 50,
                    child: TextFormField(
                        maxLength: 2,
                        maxLines: 1,
                        inputFormatters: <TextInputFormatter>[
                            UpperCaseTextFormatter()
                        ],
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: MyColors.appColorBlue2(),
                                ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: MyColors.appColorGrey400(),
                                    width: 2.0,
                                ),
                            ),
                            focusedErrorBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: MyColors.appColorGrey400(),
                                    width: 2.0,
                                ),
                            ),
                            errorStyle: TextStyle(
                                color: MyColors.appColorRed(),
                                fontWeight: FontWeight.w500,
                            ),
                            errorBorder:  OutlineInputBorder(
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
                    ),
                ),
                const SizedBox(width: 10),
                Expanded(child: Container(

                    child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: MyColors.appColorBlue2(),
                                ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: MyColors.appColorGrey400(),
                                    width: 2.0,
                                ),
                            ),
                            focusedErrorBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: MyColors.appColorGrey400(),
                                    width: 2.0,
                                ),
                            ),
                            errorStyle: TextStyle(
                                color: MyColors.appColorRed(),
                                fontWeight: FontWeight.w500,
                            ),
                            errorBorder:  OutlineInputBorder(
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
                    ),
                ),)
            ],),

        ],
    );
    
    
}
class UpperCaseTextFormatter extends TextInputFormatter {
    @override
    TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
        return TextEditingValue(
            text: capitalize(newValue.text),
            selection: newValue.selection,
        );
    }
}
String capitalize(String value) {
    if(value.trim().isEmpty) return "";
    return value.toUpperCase();
}
