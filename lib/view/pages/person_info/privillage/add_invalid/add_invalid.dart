import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/privillage/add_invalid/invalid_addsheet/add_type.dart';
import 'package:mydtm/view/pages/person_info/privillage/add_invalid/provider_add_invalide.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class InvalidAdd extends StatefulWidget {
  const InvalidAdd({Key? key}) : super(key: key);

  @override
  State<InvalidAdd> createState() => _InvalidAddState();
}

class _InvalidAddState extends State<InvalidAdd> {
  ProviderAddInvalide providerAddInvalide = ProviderAddInvalide();

  fffState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerAddInvalide,
      child: Consumer<ProviderAddInvalide>(
          builder: (context, value, child) => Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: providerAddInvalide.formKeyInvalide,
                child: Scaffold(
                  backgroundColor: MyColors.appColorGrey100(),
                  appBar: AppBar(
                      backgroundColor: MyColors.appColorGrey100(),
                      elevation: 0,
                      iconTheme: IconThemeData(
                        color: MyColors.appColorBlack(),
                      )),
                  body: SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "addInvalid".tr(),
                              style: TextStyle(
                                  color: MyColors.appColorBlack(),
                                  fontSize: 24),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "invalidGroup".tr(),
                              style: TextStyle(
                                  color: MyColors.appColorGrey600(),
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Card(
                              child: ListTile(
                                trailing: const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 17),
                                onTap: () {
                                  modelInvalidType(
                                      context: context,
                                      providerAddInvalide: providerAddInvalide);
                                  setState(() {});
                                },
                                title:
                                    Text(providerAddInvalide.invalidType == "1"
                                        ? "invalid1".tr()
                                        : providerAddInvalide.invalidType == "2"
                                            ? "invalid2".tr()
                                            : "invalidChooseGroup".tr()),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text("document".tr(),
                                style: TextStyle(
                                    color: MyColors.appColorGrey600(),
                                    fontSize: 16)),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller:
                                  providerAddInvalide.textEditingController,
                              maxLines: 1,
                              textAlignVertical: TextAlignVertical.center,
                              maxLength: 20,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "AA-1234567",
                                prefix: const SizedBox(width: 5),
                                suffixIcon: GestureDetector(
                                  child: const Icon(Icons.clear, size: 12),
                                  onTap: () {},
                                ),
                                contentPadding: const EdgeInsets.all(8),
                                fillColor: Colors.white,
                                filled: true,
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
                              validator: (validate) {
                                if (validate.toString().length < 7) {
                                  return "docLength7".tr();
                                } else {
                                  return "";
                                }
                              },
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "documentDate".tr(),
                              style: TextStyle(
                                  color: MyColors.appColorGrey600(),
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Card(
                                child: ListTile(
                              title: Text(
                                  providerAddInvalide.invalidDate1.length > 5
                                      ? providerAddInvalide.invalidDate1
                                      : "documentDate".tr()),
                              trailing: const Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 17),
                              onTap: () {
                                providerAddInvalide.selectDate(
                                    context: context, fff: fffState);
                              },
                            )),
                            const SizedBox(height: 20),
                            Text("dateInvalid".tr(),
                                style: TextStyle(
                                    color: MyColors.appColorGrey600())),
                            const SizedBox(height: 5),
                            Card(
                                child: ListTile(
                              title: Text(
                                  providerAddInvalide.invalidDate2.length > 5
                                      ? providerAddInvalide.invalidDate2
                                      : "dateInvalid".tr()),
                              trailing: const Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 17),
                              onTap: () {
                                providerAddInvalide.selectDate2(
                                    context: context, fff: fffState);
                              },
                            )),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: CheckboxListTile(
                                  onChanged: (val) {
                                    providerAddInvalide.getBlind(isBlind: val!);
                                  },
                                  value: providerAddInvalide.boolInvalidIsBlind,
                                  title: Text("blind".tr())),
                            ),
                            const SizedBox(height: 30),
                            MaterialButton(
                                onPressed: () {
                                  if (providerAddInvalide.invalidType == "1" ||
                                      providerAddInvalide.invalidType == "2" &&
                                          providerAddInvalide
                                              .formKeyInvalide.currentState!
                                              .validate() &&
                                          providerAddInvalide
                                                  .invalidDate1.length >
                                              6 &&
                                          providerAddInvalide
                                                  .invalidDate2.length >
                                              6) {
                                    providerAddInvalide.sendServer(
                                        context: context);
                                  } else {
                                    AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.NO_HEADER,
                                            animType: AnimType.BOTTOMSLIDE,
                                            dismissOnTouchOutside: false,
                                            title: "DTM",
                                            desc: "fillUpRow".tr(),
                                            titleTextStyle: TextStyle(
                                                color: MyColors.appColorBlue1(),
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                            descTextStyle: TextStyle(
                                                color: MyColors.appColorBlack(),
                                                fontWeight: FontWeight.bold),
                                            btnCancelColor:
                                                MyColors.appColorBlue1(),
                                            btnCancelOnPress: () {},
                                            btnCancelText: "OK")
                                        .show();
                                  }
                                },
                                height: 45,
                                minWidth: double.infinity,
                                color: MyColors.appColorBlue1(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: MyWidgets.robotoFontText(
                                    text: "access".tr(),
                                    textColor: MyColors.appColorWhite())),
                          ],
                        )),
                  ),
                ),
              )),
    );
  }
}
