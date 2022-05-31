import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget province(
    {required BuildContext context,
    required ProviderAddressInfo providerAddressInfo}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(text: "province".tr(), textSize: 15),
      const SizedBox(height: 8),
      GestureDetector(
        onTap: () {
          providerAddressInfo.getRegion(
              context: context, providerAddressInfo: providerAddressInfo);
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: MyColors.appColorGrey400())),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                 Flexible(
              child: Text(
                providerAddressInfo.provinceName.toString().length < 4 || providerAddressInfo.provinceName != null
                    ? "Tanlang..."
                    : providerAddressInfo.provinceName,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 1,
                style: TextStyle(
                    color: providerAddressInfo.provinceName.toString().length < 5 || providerAddressInfo.provinceName != null
                        ? MyColors.appColorGrey400()
                        : MyColors.appColorBlack(),
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto-Medium'),
              ),
            ),
                Icon(
              Icons.arrow_drop_down,
              color: MyColors.appColorBlack(),
              size: 32,
            )
          ]),
        ),
      ),
    ],
  );
}
