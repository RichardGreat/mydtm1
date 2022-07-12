import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class ChangePhoneNumber extends StatefulWidget {
  ProviderProfile providerProfile;
  Function function;

  ChangePhoneNumber(
      {Key? key, required this.providerProfile, required this.function})
      : super(key: key);

  @override
  State<ChangePhoneNumber> createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.function();
        return true;
      },
      child: Scaffold(
        backgroundColor: MyColors.appColorWhite(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: MyColors.appColorBlack()),
          elevation: 0,
          backgroundColor: MyColors.appColorWhite(),
        ),
        body: SafeArea(
            child: Form(
          key: widget.providerProfile.formKeyChangePhone,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  MyWidgets.robotoFontText(text: "enterNewPhone".tr()),
                  const SizedBox(height: 10),
                  TextFormField(
                      controller: widget.providerProfile.textChangePhoneNum,
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      maxLength: 9,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        prefixText: "+998 ",
                        suffixIcon: GestureDetector(
                          child: const Icon(Icons.clear, size: 12),
                          onTap: () {
                            widget.providerProfile.textChangePhoneNum.clear();
                          },
                        ),
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
                        errorMaxLines: 2,
                      ),
                      validator: (value) {
                        if (value == null || value.length < 9) {
                          if (value!.length > 1) {
                            String kod = value.substring(0, 2);
                            for (var element
                                in MyWidgets.checkTelephoneCompanyCode) {
                              if (element.contains(kod)) {
                                widget.providerProfile.myBoolWidget = true;
                                break;
                              } else {
                                widget.providerProfile.myBoolWidget = false;
                              }
                            }
                            if (!widget.providerProfile.myBoolWidget &&
                                value.length < 3) {
                              return "kodError".tr();
                            } else {
                              return "kodLength".tr();
                            }
                          } else {
                            return "kodError".tr();
                          }
                        } else {
                          String kod = value.substring(0, 2);
                          for (var element
                              in MyWidgets.checkTelephoneCompanyCode) {
                            if (element.contains(kod)) {
                              widget.providerProfile.myBoolWidget = true;
                              widget.providerProfile
                                  .boolButtonCol1(boolValue: true);
                              break;
                            } else {
                              widget.providerProfile
                                  .boolButtonCol1(boolValue: false);
                              widget.providerProfile.myBoolWidget = false;
                            }
                          }
                          if (!widget.providerProfile.myBoolWidget) {
                            widget.providerProfile
                                .boolButtonCol1(boolValue: false);
                            return "kodError".tr();
                          } else {
                            widget.providerProfile
                                .boolButtonCol1(boolValue: true);
                          }
                        }
                        return null;
                      }),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      widget.providerProfile
                          .changePhoneNumber(context: context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: MyColors.appColorBlue1(),
                    height: 50,
                    minWidth: double.infinity,
                    child: MyWidgets.robotoFontText(
                        text: "access".tr(),
                        textColor: MyColors.appColorWhite()),
                  )
                ]),
          ),
        )),
      ),
    );
  }
}
