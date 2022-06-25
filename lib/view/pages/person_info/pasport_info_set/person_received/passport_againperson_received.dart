import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/input_pasport.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

modelSheetPersonReceived(
    {required BuildContext context,
    required ProviderPersonInfo providerPersonInfo,
    required String imie}) {
  showModalBottomSheet<void>(
      enableDrag: true,
      backgroundColor: MyColors.appColorWhite(),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();

                    }, icon:const Icon(Icons.arrow_back_outlined)),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Image.asset("assets/images/passport.png"),
                    //   ],
                    // ),
                    // const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyWidgets.robotoFontText(text: "personCode".tr()),
                      ],
                    ),
                    /// JShSHIR
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: MyColors.appColorGrey400(), width: 1)
                      ),
                      child:
                          Row(children: [MyWidgets.robotoFontText(text: imie)]),
                    ),
                    const SizedBox(height: 10),
                    MyWidgets.robotoFontText(text: "passport".tr()),
                    const SizedBox(height: 10),
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
                            inputFormatters: <TextInputFormatter>[
                              UpperCaseTextFormatter(),
                              FilteringTextInputFormatter.allow(
                                  RegExp('[a-zA-Z]')),
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
                            validator: (value) {
                              if (value == null || value.length < 2) {
                                providerPersonInfo.boolPsSera(boolSer: false);
                                return "..";
                              } else {
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
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            decoration: InputDecoration(
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
                              if (value3!.isEmpty || value3.length < 7) {
                                providerPersonInfo.boolPsNumber(boolNum: false);
                                return "passportLength".tr();
                              } else {
                                providerPersonInfo.boolPsNumber(boolNum: true);
                                return null;
                              }
                            },
                          ),
                        ),
                        // Text()
                      ],
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: MaterialButton(

                          onPressed: () {
                            if(providerPersonInfo.txtPsSerController.text.length == 2 && providerPersonInfo.txtPsNumController.text.length == 7) {
                              providerPersonInfo.setPersonAgain(
                                context: context,
                                  psSer: providerPersonInfo.txtPsSerController.text, psNum: providerPersonInfo.txtPsNumController.text);
                            }else{
                              log("##");
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minWidth: double.infinity,
                          color: MyColors.appColorBlue1(),

                          height: 50,
                          child: MyWidgets.robotoFontText(
                              text: "access".tr(),
                              textColor: MyColors.appColorWhite()),
                        ),
                      ),
                    ))
                  ],
                )),
          ),
        );
      });
}
