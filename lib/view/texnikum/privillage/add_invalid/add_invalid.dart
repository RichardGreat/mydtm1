// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/invalid_addsheet/p2_cer_num_privil_tex.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/invalid_addsheet/p3_date_provilige_tex.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/invalid_addsheet/p6_image_priv_tex.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/invalid_addsheet/p7_button_priv_texnikum.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/provider_add_invalide.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class InvalidAddTexnikum extends StatefulWidget {
  String titleName;
  String typeWindow;

  InvalidAddTexnikum(
      {super.key, required this.titleName, required this.typeWindow});

  @override
  State<InvalidAddTexnikum> createState() => _InvalidAddTexnikumState();
}

class _InvalidAddTexnikumState extends State<InvalidAddTexnikum> {
  ProviderAddInvalideTexnikum providerAddInvalideTexnikum =
      ProviderAddInvalideTexnikum();

  fffState() {
    setState(() {});
  }

  var box = Hive.box("online");

  @override
  initState() {
    box.delete("imageTexnikum");
    box.delete("privilageTypeTexnikum");
    box.put("privilageTypeTexnikum", widget.typeWindow);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerAddInvalideTexnikum,
      child: Consumer<ProviderAddInvalideTexnikum>(
          builder: (context, value, child) => Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onWillPop: () async {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  return true;
                },
                key: providerAddInvalideTexnikum.formKeyInvalide,
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
                              widget.titleName,
                              style: TextStyle(
                                  color: MyColors.appColorBlack(),
                                  fontSize: 24),
                            ),

                            ///
                            // widget.typeWindow == "1"?
                            // privilegeTypeTexnikum(
                            //     context: context,
                            //     providerAddInvalideTexnikum:
                            //         providerAddInvalideTexnikum):
                            const SizedBox(height: 20),

                            ///
                            privilegeCerNumTexnikum(
                                context: context,
                                providerAddInvalideTexnikum:
                                    providerAddInvalideTexnikum),

                            ///
                            privilegeDateBeginTexnikum(
                                context: context,
                                providerAddInvalideTexnikum:
                                    providerAddInvalideTexnikum,
                                fffState: fffState),

                            /// privilegeEndDateTexnikum(
                            ///     context: context,
                            ///     providerAddInvalideTexnikum:
                            ///        providerAddInvalideTexnikum,
                            ///   fffState: fffState),

                            // privilegeCheckBlindTexnikum(
                            //     context: context,
                            //     providerAddInvalideTexnikum:
                            //         providerAddInvalideTexnikum),

                            ///
                            privilegeImageChooseTexnikum(
                                context: context,
                                providerAddInvalideTexnikum:
                                    providerAddInvalideTexnikum,
                                fffState: fffState),

                            ///
                            privilegeAddButtonTexnikum(
                                context: context,
                                providerAddInvalideTexnikum:
                                    providerAddInvalideTexnikum),
                          ],
                        )),
                  ),
                ),
              )),
    );
  }
}
