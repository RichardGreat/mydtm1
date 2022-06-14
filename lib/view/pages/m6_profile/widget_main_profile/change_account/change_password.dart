import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
// ignore: must_be_immutable
class ChangeAccountPasswords extends StatefulWidget {
  ProviderProfile providerProfile;
   ChangeAccountPasswords({Key? key,  required this.providerProfile }) : super(key: key);

  @override
  State<ChangeAccountPasswords> createState() => _ChangeAccountPasswordsState();
}

class _ChangeAccountPasswordsState extends State<ChangeAccountPasswords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(iconTheme: IconThemeData(color: MyColors.appColorBlack()), elevation: 0, backgroundColor: MyColors.appColorWhite()),
      body: Form(
        key:widget.providerProfile.formKeyChangePassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: Container(
              margin:const  EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
           const SizedBox(height: 20),
           MyWidgets.robotoFontText(text: "changePassport".tr(),textSize: 24),
          const SizedBox(height: 10),
           MyWidgets.robotoFontText(text: "newInputPassport".tr(),textSize: 13),
           const SizedBox(height: 20),
            TextFormField(
              controller: widget.providerProfile.textChangePassword1,
              textAlignVertical: TextAlignVertical.center,
              maxLines: 1,
              maxLength: 20,
              obscureText: widget.providerProfile.boolPasswordVisible,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                suffixIcon: GestureDetector(
                  onTap: () {
                    widget.providerProfile.boolPasswordVisibleMethod();
                    setState((){});
                  },
                  child: widget.providerProfile.boolPasswordVisible
                      ? Icon(
                    CupertinoIcons.eye_slash,
                    color: MyColors.appColorGrey600(),
                    size: 18,
                  )
                      : Icon(
                    CupertinoIcons.eye,
                    color: MyColors.appColorBlue2(),
                    size: 18,
                  ),
                ),
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
              ),
              validator: (value){
                if (value == null || value.length < 8) {
                  widget.providerProfile.boolButtonCol2(boolValue: false);
                  return "passwordLength".tr();
                }else{
                  widget.providerProfile.boolButtonCol2(boolValue: true);
                  return "";
                }
              },
            ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: widget.providerProfile.textChangePassword2,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  maxLength: 20,
                  obscureText: widget.providerProfile.boolPasswordVisible2,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        widget.providerProfile.boolPasswordVisibleMethod2();
                        setState((){});
                      },
                      child: widget.providerProfile.boolPasswordVisible2
                          ? Icon(
                        CupertinoIcons.eye_slash,
                        color: MyColors.appColorGrey600(),
                        size: 18,
                      )
                          : Icon(
                        CupertinoIcons.eye,
                        color: MyColors.appColorBlue2(),
                        size: 18,
                      ),
                    ),
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
                  ),
                  validator: (value){
                    // ignore: unrelated_type_equality_checks

                    if(value!.length > 1){
                      // ignore: unrelated_type_equality_checks
                      if(value.toString().trim() != widget.providerProfile.textChangePassword2.text) {
                        widget.providerProfile.passwordButtonColor(boolBtnCol: false);
                        return "passwordNotMatch".tr();
                      }else{
                        widget.providerProfile.passwordButtonColor(boolBtnCol: true);
                        return "true";
                      }
                    }


                  },
                ),
                  const SizedBox(height: 20),
                  MaterialButton(onPressed: (){

                  },
                      height: 50,
                      minWidth: double.infinity,
                      color:
                      widget.providerProfile.boolPasswordBtnColor ?
                       MyColors.appColorBlue2()
                       :
                      MyColors.appColorGrey600()
                      ,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                  child:MyWidgets.robotoFontText(text: "access".tr(),
                      textColor: MyColors.appColorWhite())
                  )

          ],)),
        ),
      ),
    );
  }
}
