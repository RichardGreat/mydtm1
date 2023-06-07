
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mydtm/view/sertificate_service/service_page_sert/provider_sertificates.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class ListChooseRegions extends StatefulWidget {
  Map<String, String> listCerRegions;
  ProviderCertificateService providerCertificateService;

  ListChooseRegions(
      {Key? key,
      required this.listCerRegions,
      required this.providerCertificateService})
      : super(key: key);

  @override
  State<ListChooseRegions> createState() => _ListChooseRegionsState();
}

class _ListChooseRegionsState extends State<ListChooseRegions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text("testRegion".tr(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.listCerRegions.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 8, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: MyColors.appColorGrey400(),
                  ),
                  GestureDetector(
                    onTap: () {
                      // log(widget.listCerRegions.keys.elementAt(index));
                      // log(widget.listCerRegions.values.elementAt(index));
                      widget.providerCertificateService.setNameRegion(
                          name: widget.listCerRegions.values.elementAt(index),
                          id: widget.listCerRegions.keys.elementAt(index).toString());
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 4, 8, 0),
                          child: Text(
                              widget.listCerRegions.values.elementAt(index)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
