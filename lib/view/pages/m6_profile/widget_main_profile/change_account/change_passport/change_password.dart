import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/change_passport/password_captcha.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class ChangeAccountPasswords extends StatefulWidget {
  ProviderProfile providerProfile;

  ChangeAccountPasswords({Key? key, required this.providerProfile})
      : super(key: key);

  @override
  State<ChangeAccountPasswords> createState() => _ChangeAccountPasswordsState();
}

class _ChangeAccountPasswordsState extends State<ChangeAccountPasswords> {
  @override
  initState() {
    getPhoneNum();
    super.initState();
  }

  var box = Hive.box("online");

  Future getPhoneNum() async {
    await widget.providerProfile.getCaptcha();

    widget.providerProfile.textPhoneChangePassport.text =
        box.get("phoneNumber");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: MyColors.appColorBlack()),
          elevation: 0,
          backgroundColor: MyColors.appColorWhite()),
      body: Form(
        key: widget.providerProfile.formKeyChangePassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  MyWidgets.robotoFontText(
                      text: "changePassport".tr(), textSize: 24),
                  const SizedBox(height: 10),
                  TextFormField(
                      controller:
                          widget.providerProfile.textPhoneChangePassport,
                      maxLines: 1,
                      enabled: false,
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
                  captchaGetPassport(
                      context: context,
                      providerProfile: widget.providerProfile),
                  const SizedBox(height: 20),
                  MaterialButton(
                      onPressed: () {
                        if (widget
                            .providerProfile
                            .textCaptchaEditingControllerPassport
                            .text
                            .isNotEmpty) {

                          widget.providerProfile
                              .getNewPassport(context: context);

                        } else {
                          MyWidgets.scaffoldMessengerBottom(
                              context: context, valueText: "infoNotAll".tr());
                        }
                      },
                      height: 50,
                      minWidth: double.infinity,
                      color: MyColors.appColorBlue1(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: MyWidgets.robotoFontText(
                          text: "access".tr(),
                          textColor: MyColors.appColorWhite()))
                ],
              )),
        ),
      ),
    );
  }
}
