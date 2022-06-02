import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetStateChoose(
    {required BuildContext context,
    required ProviderGraduated providerGraduated}) {
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      backgroundColor: MyColors.appColorWhite(),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        // controller:
                            // providerGraduated.txtControllerGraduatedCountry,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        onChanged: (values) {

                          providerGraduated.searchCountry(value: values);
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          counter: const SizedBox.shrink(),
                          contentPadding:
                              const EdgeInsets.only(left: 8, right: 8),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorBlue1(),
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
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        providerGraduated.closeGraduatedSheet(context: context);
                      },
                      icon: Icon(CupertinoIcons.chevron_down,
                          color: MyColors.appColorBlack()),
                    )
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: providerGraduated.listGraduatedCountryTemp.length,
                  itemBuilder: (context, index) => GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: MyWidgets.robotoFontText(
                          text: providerGraduated
                              .listGraduatedCountryTemp[index].name,
                        ),
                      ),
                    ),
                    onTap: () {
                      providerGraduated.setForeign(name:  providerGraduated
                          .listGraduatedCountryTemp[index].name, id:  providerGraduated
                          .listGraduatedCountryTemp[index].id.toString());
                      Navigator.of(context).pop();
                    },
                  ),
                )),
              ],
            ),
          ),
        );
      });
}
